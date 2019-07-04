---
layout: post
title: Networking neutron concepts
date: 2019-06-19 05:12:08 +0900
categories: [Openstack]
tags: [Openstack, Neutron]
---
Openstack Networking ([neutron]) 은 Openstack 환경의 VNI (Virtual Networking infrastructure) networking 과 PNI (Physical Networking infrastructure) access layer를 관리한다. 또한 Openstack Networking은 firewall, load balancer, virtual private network (VPN) 등을 이용해서, 프로젝트 별로 더 나은 네트워크 토폴로지 (Network Topology) 를 구성할 수 있게 해준다.
<!--more-->
Networking (Openstack Networking) 은 networks, subnets, routers를 추상화된 형태의 오브젝트로 제공하며, 각 오브젝트들은 실제 물리적인 네트워킹 (subnets을 포함한 networks, router가 subnet간의 traffic을 routing을 하는 것 등) 의 구성에 맞게 대응해서  동작한다.  

위의 Networking 환경에서는 최소한 하나의 external network가 있을 것이다. 다른 network들과는 다르게
external network는 가상으로 정의되어 있는 것이 포함되어 있지 않은 network이다. 그렇기 때문에 external network는 Openstack 환경 바깥, 물리적인 외부와의 연결에 대한 일부분을 의미한다. 바깥에 노출되어 있는 이 IP addresse를 통해 external network는 외부에서 누구나 물리적으로 접근 가능한 network가 될 수 있다.

external network에 더해서, 위 Networking 환경에서는 최소 하나 이상의 internal network들을 가지고 있다. 이 소프트웨어적으로 정의된 network (internal network) 들은 VM에 직접 연결이 된다. internal network에 속해 있는 VM에 접근하려면, 같은 router 아래의 subnet에 연결된 VM의 interface를 통해서만이 직접 연결이 가능할 것이다.

바깥에서 VM들에게 접근을 하거나 그 반대의 경우에, router들 사이에서 network들이 필요할 것이다. 각 router는 external network로 연결되는 gateway가 있을 것이고, 하나 이상의 internal network들로 연결되는 interface들이 있을 것이다. 실제 물리적인 router처럼, 같은 router의 subnet들은 서로 연결이 가능하며, 여기에 연결되어 있는 VM들은 router에 연결되어 있는 gateway를 통해 바깥의 network에 접근이 가능해진다.

[neutron]: https://docs.openstack.org/neutron/latest/index.html
