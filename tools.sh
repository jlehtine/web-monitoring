# Default monitoring tools
# May be extended by providing `custom-tools.sh`


#
# Monitoring functions
#

# The monitoring functions may expect the following:
# - `$1`: monitored URL
# - `$2`: output file
# - `$site_tries`: number of attempts to be made
# - `$site_timeout`: timeout in seconds
#
# The monitoring functions MUST return with zero return code on success and
# non-zero on error.

# Web monitoring with wget
monitor_wget () {
    wget \
        --tries="$site_tries" \
        --timeout="$site_timeout" \
        -O "$2" \
        "$1"
}

# Web monitoring with curl
monitor_curl () {
    curl \
        --retry "$(( $site_tries - 1 ))" \
        --max-time "$site_timeout" \
        -o "$2" \
        "$1"
}
