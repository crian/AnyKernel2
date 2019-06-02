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

# Set min cpu freqs
echo 518400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 806400 > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq

# Configure interactive governor settings
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo "70 672000:45 825600:50 1036800:60 1248000:70 1478400:85" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
echo 40000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 30000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate

echo 99 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 1574400 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo "19000 1400000:39000 1700000:19000 2100000:79000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
echo "85 1728000:80 2112000:90 2342400:95" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 30000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
echo 19000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
echo 39000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis

# Adjust lmk
echo "18432,23040,27648,32256,55296,80640" > /sys/module/lowmemorykiller/parameters/minfree
