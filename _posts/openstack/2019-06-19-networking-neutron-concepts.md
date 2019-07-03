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

어느 Networking 환경이든 최소한 하나의 external network가 있을 것이다. 그리고 다른 network들과는 다르게 external network는 가상의 요소가 포함되어 있지 않을 것이다.

[neutron]: https://docs.openstack.org/neutron/latest/index.html
