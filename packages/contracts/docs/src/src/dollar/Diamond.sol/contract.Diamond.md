# Diamond
[Git Source](https://github.com/ubiquity/ubiquity-dollar/blob/b1159e7c3923d0cfce274dbf1d6127a376670810/src/dollar/Diamond.sol)

Contract that implements diamond proxy pattern

*Main protocol's entrypoint*


## Functions
### constructor

Diamond constructor


```solidity
constructor(DiamondArgs memory _args, IDiamondCut.FacetCut[] memory _diamondCutFacets);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_args`|`DiamondArgs`|Init args|
|`_diamondCutFacets`|`IDiamondCut.FacetCut[]`|Facets with selectors to add|


### fallback

Finds facet for function that is called and executes the
function if a facet is found and returns any value


```solidity
fallback() external payable;
```

