#!/system/bin/sh

sleep 30;

# Set cpu permissions
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor

# kcal config
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_cont
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_hue
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_sat
chmod 0664 /sys/devices/platform/kcal_ctrl.0/kcal_val

# Tweak IO performance after boot complete
echo 128 > /sys/block/sda/queue/read_ahead_kb
echo 1 > /sys/block/sda/queue/iostats
echo 128 > /sys/block/sda/queue/nr_requests

echo 128 > /sys/block/sde/queue/read_ahead_kb
echo 1 > /sys/block/sde/queue/iostats
echo 128 > /sys/block/sde/queue/nr_requests

echo 128 > /sys/block/sdf/queue/read_ahead_kb
echo 1 > /sys/block/sdf/queue/iostats
echo 128 > /sys/block/sdf/queue/nr_requests

# Set cpu input boost
echo 100 > /sys/module/cpu_input_boost/parameters/input_boost_duration
echo 979200 > /sys/module/cpu_input_boost/parameters/input_boost_freq_hp
echo 960000 > /sys/module/cpu_input_boost/parameters/input_boost_freq_lp
echo 300000 > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_hp
echo 300000 > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_lp

# Set dynamic stune boost
echo 15 > /sys/module/cpu_input_boost/parameters/dynamic_stune_boost

# Configure virtual memory
echo 65 > /proc/sys/vm/swappiness
echo 5 > /proc/sys/vm/dirty_ratio
echo 2 > /proc/sys/vm/dirty_background_ratio

# Set dt2w
echo 1 > /sys/android_touch/doubletap2wake
