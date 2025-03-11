resource "proxmox_vm_qemu" "srv_test_1" {
    name = "srv-test-1"
    # Can Desc and VMid be generated procedurally?
    desc = "Ubuntu Server" 
    vmid = "411"
    target_node = "proxmox2"

    # Qemu agent
    agent = 1

    # Template 
    clone = "ubuntu-server-noble"

    # VM characteristics
    cores = 1
    sockets = 1
    cpu_type = "host"
    memory = 2048

    network {
        id = 0
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "disk"
        size = "20G"
        slot = "ide0"
    }

    os_type = "cloud-init"
    ipconfig0 = "ip=10.10.4.20/24,gw=10.10.4.1"
    nameserver = "10.10.4.1"
    ciuser = "blue-team"
    sshkeys = <<EOF
    ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAF5+tmQOOrzORg1u02Vjf1Tu/IDMC/pRh/ire/51r4LMp4NMmBzOINFyUybBqk3gOV8tuMKWJXRYVtJSiz0q2yRwgH9+Ue/llBd+PLUd8NL0mHEO4RvNTixV5hgksCo69zn2f0hBrGl3IjobJ9V8HlKfZONgnEeGfvQBTQS1MuLPE2Aow== Normal@LAPTOP-GMAFHAQV
    EOF
}