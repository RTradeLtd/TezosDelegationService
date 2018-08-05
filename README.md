# TezosDelegationService

repo for our tezos delegation service

## Alphanet

We are currently testing out a delegate on the Alphanet that was brought online August 4th. After we test the Alphanet, and get some reliable baking going, we will move to the zeronet where an official beta of our delegation service will take place. Should you wish you play around with our delegate service on the alphanet as we get accustomed to running a Tezos node, feel free to check the following link for our delegate address

* [Delegate Address](http://alphanet.tzscan.io/tz1bhL4zwmLJvHJK5ejDDKdeatpqorvJdc2s)

## Contents

### Scripts

* `tezos_install.sh`
  * Used to install tezos node software
* `tezos_manager.sh`
  * Used to assist in managing a tezos node
  
## Tutorials/Resources

* [baking how to](https://gist.github.com/dakk/bdf6efe42ae920acc660b20080a506dd)
* [baking explained](https://www.reddit.com/r/tezos/comments/92p29s/tezos_baking_explained/)

## Troubleshooting

* If you are having troubles syncing, make sure your identity was generated with a PoW difficulty of 26

### Links

* [p2p.maintenance: Too few connections (0)](https://gitlab.com/tezos/tezos/issues/265)
* [Technical FAQ](https://github.com/tezoscommunity/faq/wiki/Tezos-Technical-FAQ)