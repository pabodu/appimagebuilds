busctl call org.freedesktop.machine1 \
            /org/freedesktop/machine1 \
            org.freedesktop.machine1.Manager \
            CreateMachine \
            "sayssusa(sv)" \
            "my-container" \
            0 \
            "" \
            "container" \
            1234 \
            "/var/lib/machines/my-container" \
            0
