### Partition the disks

# Replace sda with the right disk label

# Fill the disk with random data
# shred --random-source=/dev/urandom --iterations=1 /dev/sda # replace sda by the targerted disk

# Create the partition table
parted -s /dev/sda mklabel gpt
# Create the boot/efi partition
parted -s /dev/sda mkpart efi fat32 1MiB 257MiB # Leave a gap of 1 MB at the beginning, so no matter what block size my SSD uses, the boot partition will always be properly aligned
parted -s /dev/sda set 1 esp on # The esp flag identifies the partition as a UEFI system partition
# Format the partition
mkfs.fat -F 32 /dev/sda1

# Create the encrypted partition (where all other partitions will be located)
parted -s /dev/sda mkpart cryptlvm 257MiB '100%'

# At this point, it might be needed to reboot so that the kernel is aware of the changes