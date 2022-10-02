# Shields

Main repo for the Shields smart contracts.

## Deployment Addresses
| Contract                           | Address                                      | Source Code                                                                                                                   |
| ---------------------------------- | -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Shields                            | `0x0747118C9F44C7a23365b2476dCD05E03114C747` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/Shields.sol               |
| EmblemWeaver                       | `0x3E2063199F7b98b8188B7649d95bd0C82f4B0001` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/EmblemWeaver.sol          |
| FieldGenerator                     | `0x0230eB753Df1A12063B357EB5e3A4F9Ce0780C1F` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/FieldGenerator.sol        |
| HardwareGenerator                  | `0x355944B17A0770190eCB375ec3E64b98Cb31a576` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/HardwareGenerator.sol     |
| FrameGenerator                     | `0x3b6cdEC2F91F4C7780C966B7Bfc6a8f55083863e` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/FrameGenerator.sol        |
| ShieldBadgeSVGs                    | `0xCCAc9aB49b53B7c228C47C55ac8B5704cFc57997` | https://github.com/Area-Technology/shields-contracts/blob/main/contracts/SVGs/ShieldBadgeSVGs.sol  |

All crest SVG addresses are listed in [deployedSVGs.json](https://github.com/Area-Technology/shields-contracts/blob/main/deploySVGs/deployedSVGs.json).

## Setup Instructions

Must be running `node v14` or later.

### Testing

First make sure you have run `yarn install` and `yarn run build`.

```
yarn run test
```

to update snapshots:
```
UPDATE_SNAPSHOT=1 yarn test
```
