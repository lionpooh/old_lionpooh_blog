---
layout: post
title: Neutron Networking overview
date: 2019-06-18
categories: [openstack]
tags: [openstack, neutron]
---
Openstack Networking service [neutron]은 Openstack Networking을 API를 통해서 정의, 제공하며 Openstack Compute service [nova] 에서 사용하는 virtual networking infrastructure (networks, switches, subnets, routers) 의 생성, 관리를 (creation and management) 한다.
<!--more-->

neutron은 크게 3가지 component로 나눌 수 있다.  

* **neutron-server**  
  Neutron api 요청을 받아서 적절한 Openstack Networking plug-in의 action을 처리한다.

* **Openstack Networking plug-ins, agents**  
  Port의 plug, unplug 또는 network 와 subnet의 생성과 ip 할당 작업을 수행하는 plug-in들과 agent들은 클라우드에서 사용하는 장비와 벤더 (vendor) 마다 다를 수 있다. Openstack Networking에서는 Cisco의 가상/물리 switche들과, NEC Openflow 제품들, Open vSwitch, Linux bridging, VMware NSX등을 plug-in과 agent를 통해서 제공한다.

* **Messaging queue**
  Openstack Networking의 설치에 대한 route 정보를 neutron-server와 다양한 agent들 사이에서 주고 받기 위해 사용된다. 또한 plug-in의 networking의 상태를 database에 저장하기 위해 사용되기도 한다.

[nova]: https://docs.openstack.org/nova/latest
[neutron]: https://docs.openstack.org/neutron/latest/index.html
