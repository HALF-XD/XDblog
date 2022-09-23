#### 合约

##### 合约中的时间

秒级的，不是毫秒级的。

[**Solidity fundamentals: working with dates and time**](https://soliditytips.com/articles/solidity-dates-time-operations/)

`UNPREDICTABLE_GAS_LIMIT `

尽管不用支付手续费，但是函数计算量仍受区块 gas 限制。

两个可能性：函数内有逻辑错误，或者函数计算量确实太大了

#### solidity

`.sol`文件中引入

```
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import './IERC20.sol';
```

报错

```
This declaration shadows an existing declaration
```

#### slidity 中的数字处理

bigint
