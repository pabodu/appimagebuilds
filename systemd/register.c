#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <systemd/sd-bus.h>

int main() {
    sd_bus_error error = SD_BUS_ERROR_NULL;
    sd_bus *bus = NULL;
    int r;

    // Connect to the system bus
    r = sd_bus_open_system(&bus);
    if (r < 0) {
        fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
        return 1;
    }

    // Parameters for CreateMachine
    const char *machine_name = "my-container";
    uint8_t uuid[16] = {0}; // Simplified: 16-byte zeroed uuid
    const char *service = "my-service";
    const char *class = "container";
    const char *root_dir = "/var/lib/machines/my-container";
    pid_t leader_pid = 1234; // Assume PID 1234 is the container leader

    // Call CreateMachine via D-Bus
    r = sd_bus_call_method(
        bus,
        "org.freedesktop.machine1",       // Service
        "/org/freedesktop/machine1",      // Object Path
        "org.freedesktop.machine1.Manager", // Interface
        "CreateMachine",                  // Method
        &error,                           // Object for error info
        NULL,                             // Reply Message
        "sayssus",                        // Input Arguments Signature
        machine_name,                     // 1. Name
        16, uuid,                         // 2. UUID
        service,                          // 3. Service
        class,                            // 4. Class
        "",                                // 5. Mask (unused)
        leader_pid,                       // 6. Leader PID
        root_dir                          // 7. Root Directory
    );

    if (r < 0) {
        fprintf(stderr, "Failed to create machine: %s\n", error.message);
        sd_bus_error_free(&error);
    } else {
        printf("Machine '%s' registered successfully.\n", machine_name);
    }

    sd_bus_unref(bus);
    return r < 0 ? 1 : 0;
}

