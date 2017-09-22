cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    # run standard config scripts
    ds runcfg set_prompt
    ds runcfg ssmtp
    ds runcfg mysql
    ds runcfg apache2

    # run moodle config scripts
    ds runcfg 01_mount_tmp_on_ram
    ds runcfg 02_fix_apache2_config
    ds runcfg 03_fix_mysql_config
    ds runcfg 04_create_db
    ds runcfg 05_moodle_install
    ds runcfg 06_moodle_config
    ds runcfg 07_config_oauth2
    ds runcfg 08_setup_cron

    # install additional plugins
    ds runcfg plugin/offlinequiz
    ds runcfg plugin/bigbluebutton
    ds runcfg plugin/coderunner

    # cleanup
    ds cc
}
