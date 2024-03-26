# TODO

- Use Dev Space instead of skaffold?
- [x] Implement Istio ambient
  - Would be nice to save lots of resources by not deploying any istio sidecars
  - https://istio.io/latest/docs/ops/ambient/getting-started/ This got deployed easily.
    Still would like to see if monitoring will work out of the box.
  - Using new Gateway api of kubernetes
- [ ] Deploy with Pulumi
- [ ] Deploy with Terraform (why not)
- [ ] Research and Implement more monitoring (probably an eBPF system) 
- [ ] [Chaos testing](https://github.com/Shopify/toxiproxy)