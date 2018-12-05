! Configuration File for keepalived

global_defs {
}

vrrp_instance KUBEAPI {
    interface KEEPALIVED_INTERFACE
    virtual_router_id 50
    nopreempt
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass AUTH_PASSWORD
    }
    virtual_ipaddress {
        KEEPALIVED_VIP
    }
}
