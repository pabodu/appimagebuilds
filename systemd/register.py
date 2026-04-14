#!/usr/bin/python3

import dbus
import uuid

# Parameters for the new machine
machine_name = "my-container"
service = "nspawn"  # Or 'libvirt-lxc', etc.
class_type = "container" # Or 'vm'
root_dir = "/var/lib/machines/my-container"

# Generate a random UUID for the machine
machine_uuid = uuid.uuid4().hex

# Connect to the system bus
bus = dbus.SystemBus()

try:
    # Get the systemd-machined object
    machined = bus.get_object('org.freedesktop.machine1', 
                              '/org/freedesktop/machine1')
    
    # Get the interface for the object
    manager = dbus.Interface(machined, 
                             'org.freedesktop.machine1.Manager')

    # Create the machine
    # CreateMachine(name, uuid, service, class, root_dir, [extra_args])
    machine_path = manager.CreateMachine(
        machine_name,
        machine_uuid,
        service,
        class_type,
        root_dir
    )

    print(f"Machine {machine_name} created at: {machine_path}")

except dbus.DBusException as e:
    print(f"Error creating machine: {e}")

# To check:
# machinectl list

