# Liquidity Pool with Timelocks
## But first, what's a liquidity pool?
### Principe général

Liquidity pools are essential components of the decentralized finance ecosystem, or DeFi, which operates on the blockchain. They are essential for the operation of decentralized exchanges (DEX), which are an alternative to traditional, centralized exchanges.

A liquidity pool is essentially a common fund of tokens locked in a smart contract. This pool is used to facilitate trading transactions, enabling users to trade without the need for a direct counterparty for each transaction. Instead, transactions are carried out with tokens from the liquidity pool.

Liquidity providers are individuals or entities who deposit their tokens in these pools. In return, they receive a transaction fee proportional to their contribution, which can provide a passive return. This is a way for crypto-currency holders to earn income on their holdings instead of leaving them unused in their portfolio.

However, providing liquidity is not without risk. In particular, there is the risk of "impermanent loss". This is a phenomenon that occurs when the value of the tokens in a liquidity pool fluctuates from the time they were deposited. If the value of the tokens has fluctuated significantly, the liquidity provider may have lost value by simply holding on to its tokens.

Liquidity pools are an important innovation in decentralized finance, but they require in-depth understanding and careful risk management.

### Examples of current liquidity pools
#### UniSwap

##### Uniswap V1

Uniswap V1 is the original version that introduced the liquidity pool concept in 2018 to facilitate decentralized trading. However, it had certain limitations, including the requirement for an equal pool of two assets to provide liquidity. 

V1 used an Automated Market Maker (AMM) mechanism that enables users to carry out permissionless token transactions on the Ethereum blockchain without the need for an order book. It adopted the constant product model, i.e. x*y=k, where x and y are the balances of the two tokens in the exchange pair.

##### Uniswap V2

Uniswap V2 was released in May 2020. At the same time, in September 2020, SushiSwap began to appear on the crypto community scene. This really enabled Uniswap to start attracting market attention and consolidating its position in the field of decentralized commerce.

Uniswap V2 introduced a number of enhancements, including the ability to create liquidity pools with any pair of ERC-20 tokens (not just ETH), the introduction of "flash swap" functionality (allowing you to borrow any amount of tokens from a liquidity pool on condition that you repay at the end of the transaction), and a major improvement to the TWAP (Time Weighted Average Price) oracle.

Uniswap V2 has also contributed to the rapid development of decentralized finance (DeFi) by providing users with an important source of liquidity.

##### Uniswap V3

Uniswap V3 was launched in May 2021, introducing the concept of "Concentrated Liquidity". This concept allows liquidity providers to define specific price ranges within a currency pair for more precise price control. This allows liquidity providers to increase transaction fee revenues and reduce the possibility of exploiting price differences for arbitrage trading.

The V3 oracle can extend the period of data availability to 9 days or more with a single call on the channel, while reducing gas consumption by around 50% through overall TWAP optimization, and single trades will be around 30% cheaper than equivalent V2 features.

In addition, while Uniswap V2 adopts a standard transaction fee of 0.3%, V3 offers three independent fee levels: 0.05%, 0.3% and 1%. This allows liquidity providers to choose the pool according to the risk they are willing to bear. For the first time, V3 has introduced the use of NFT as proof of liquidity provision by LP, i.e. the liquidity provided is tracked by non-fungible ERC721 tokens.

##### Uniswap V4

Uniswap V4 will introduce the concept of "Hooks" to the platform. This should enable future developers to create on-chain limit orders, automatic deposits into lending protocols, automatically compounded liquidity provider (LP) fees, and many other innovations for the exchange once it goes live.

According to Uniswap's creator, the aim of v4 is to "create a way for pool deployers to introduce code that performs a designated action at key points in the pool lifecycle - such as before or after a trade, or before or after an LP position change."

For example, deployers will be able to create time-weighted average market makers that allow users to sell large amounts of crypto in small batches over time. This can help traders avoid being front-run by Ethereum virtual machine bots or suffering adverse price movements. On-chain limit orders will also be possible, as pools will be able to integrate logic that allows them to execute an order only when a token reaches a given price.

Uniswap also has a token called UNI which is used to vote on governance proposals and to provide liquidity to the Uniswap protocol. Among other things, UNI token holders can decide to add new features to the protocol or change the fee structure.

#### QuipuSwap

QuipuSwap is an automated decentralized exchange (DEX) that enables the transparent exchange of Tezos-based tokens. This means that anyone can add their FA1.2 or FA2 tokens to QuipuSwap and establish an exchange pair, even if they don't have access to the Tezos protocol itself.

When a user contributes cash to a pool, he obtains shares in the form of LP Tokens. These LP Tokens can be used within the ecosystem for other products, and are also transferable.

QuipuSwap enables tokens to be delegated at the same time as rewards are earned in a liquidity pool. As tokens are added to the pool, you automatically start receiving baking rewards. It's not compulsory to vote for a particular baker, but you can if you have a favorite or want to help spread the delegate stakes more evenly. Baking rewards are only available for Tez/Token pools, not for Token/Token pools. It's also possible to ban a baker for 3 months if the vote is more than a third of the total.

As for versions and features, Quipuswap has the same as Uniswap.

## Problems to solve: Frontrunning and Sandwich Attack

> Both are a form of market manipulation where traders take advantage of knowledge of a pending order to buy or sell a crypto-currency before the order is executed. 
Unlike traditional financial markets, which are centralized and regulated, the crypto-currency market can be decentralized and largely unregulated. This can make it more difficult to detect and prevent circumvention operations, as there is no central authority overseeing trading activity.
Another difference is the high volatility of the crypto-currency market. Crypto-currency prices can fluctuate rapidly and unpredictably, multiplying the opportunities for traders to practice these methods.

### Front running
It occurs when an entity, usually a validator, takes advantage of its position to place a trade ahead of other pending trades. In this way, he might place his own buy order before that order, then sell at a higher price once the larger order has driven the price up. This practice can be detrimental to market fairness.

### Sandwich Attack
This is a specific form of front running: an attacker places a buy transaction just before a large pending buy transaction, then places a sell transaction just after. In this way, the attacker buys at a low price, then sells at a higher price after the large transaction has raised the price.

## General solutions

>💡 There is no single solution to front-running problems on all platforms. On the contrary, various anti-front-running approaches exist on different projects, depending on the scenario, but are not 100% effective.

### Ways to avoid front-running on the trader's side

* **Use large liquidity pools:** Front runners prefer pools with low liquidity, because there is less competition and also less chance of their transaction being disrupted by a large order that would alter the pool's w

* **Keep maximum slippage low:** Slippage is when a trading order executes at a different price from the one seen at the time the trade is confirmed. Since the crypto market is volatile, prices can change between the time the trade is confirmed and the time the trading platform executes it. Consequently, if the trader sets his maximum slippage at a low level, around 0.5% to 2%, this may repel front runners.

* ** Overpaying for gas:** By paying too little for gas, trades stay in the queue longer, which also gives front-runners more time to exploit trades and make profits. Conversely, overpaying for gas will reduce the risk of a front-runner.

* **Placing a low-value order:** Front runners have to pay gas charges twice, on entering and exiting the market, and recover the amount paid as a trading fee. Their profits don't start until they've recouped their expenses. So most of the time, trading with amounts below $1,000 is unprofitable for them.

* **Finding a buyer:** By staying away from the public markets and, consequently, from front-running, when you find a buyer and successfully negotiate a price, an exchange on the chain is executed with confidence.


### Ways to avoid front-running on the DEX side

* **Fast matching in DEX:** Front runners are looking for slow matching speed to place their orders before execution. So with fast matching, there will be little room for front runners to get their process up and running. A super-fast blocking time will effectively render most frontrunners unable to react, however advanced technical knowledge can still override this method.

* **Decentralized matching engine:** In the case of a centralized matching engine, it's impossible to know whether the exchange itself is not involved in frontrunning. Decentralized matching engines allow anyone operating a complete node to view the matching in real time. They can manually match the last block trade with the current order book.

* **Periodic auction matching:** Periodic auction matching adds an extra layer of security right from the start. It adds a non-deterministic layer that makes it unlikely for anyone to know the price of the next execution unless they know the matching logic, the incoming orders for the next block, the transaction price and the current order book from the last match.


## Solution on Tezos : Timelocks

> Despite all the solutions described above, it would appear impossible, even with Uniswap V4, to reliably avoid all front runs.

Time-lock encryption allows a message to be encrypted in such a way that it can be decrypted in one of two ways. Either the author of the ciphertext produces plaintext (and proof of correct decryption) by supplying the information used to generate the time-lock. Or a sequential calculation can decrypt the ciphertext after a calculation requiring T sequential operations, for a predetermined constant T.

1. During an initial period, a contract collects Michelson values submitted by users and encrypted by Timelock, as well as a store of value, such as tez.

2. In a second period, after the values have been collected, the contract asks users to decrypt the value they have submitted and prove that the decryption is correct.

3. During a third period, if a value is not decrypted, everyone can claim part of the deposit by submitting a decryption of the value, with the other part of the deposit being burnt. Different penalties can be imposed depending on whether the user has simply failed to submit the decryption key, or has intentionally encrypted invalid data. Different rewards can be distributed for submitting a correct decryption. The third period should be long enough to give users time to perform Timelock decryption.

4. Finally, the contract can calculate a function of all data decrypted or decrypted.

Thus, using a time-lock in a liquidity pool, it would be impossible to predict which token, and in what quantity, will be exchanged: front-running would therefore become impossible.

## Introducing the Timelocks liquidity pool
### Contract storage

* First of all, there's the storage of the liquidity pool itself, with the two tokens A and B in the form of FA2.1 tickets (a Tezos specificity that you can find [here](https://hackmd.io/eOQdbL1MRlW62M6l6Tjp1Q?)), as well as a natural representing the total shares of the pool.
```
(pair 
    (option (or (ticket (pair nat (option bytes))) (pair address nat (option bytes))))#tokenA
    (option (or (ticket (pair nat (option bytes))) (pair address nat (option bytes))))#tokenB
    nat)
```
* Then there's user storage. Each user is recognized by his tz1 address. They are assigned the number of timelocks they have in the queue, the 2 tickets and the number of pool shares they own.
```
(big_map
    address
    (pair
        nat
        (option (ticket (pair nat (option bytes))))
        (option (ticket (pair nat (option bytes))))
        nat
                ))
```
* Finally, there's the timelock queue: the user first sends his timelock, which arrives in the queue. After a certain time, the timelock becomes unblockable for the user who submitted it. Then, if he doesn't unlock it, anyone can decrypt it. Lastly, once it is unlocked, if it is valid, the transaction will be processed on the blockchain.
```
(pair
    nat#oldest timelock
    (pair
        nat#place of the next timelock
        (pair 
            (big_map
                nat#position of the timelock
                (pair
                    (or
                        chest#is either a chest(timelock) or bytes, if a timelock is unlocked but the one before it is not
                        bytes)
                    (pair
                        address
                        timestamp)))
            (big_map
                bytes
                nat))))
```
*The last big_map associates the hash in bytes of a timelock with its position in nat to find it more easily in the queue.*
![TL1](https://github.com/ThomasRodriX/liquidity-pool-timelock/assets/113580716/a018e1cf-620c-4a4d-88a7-0522a4cd1179 )
As shown in the image above, the queue looks like this:
1. Users publish their timelock
2. The timelock sender can unlock it
3. The sender has not unlocked his timelock, so anyone can unlock it and his transaction will go through no matter what.

### Contract entrypoints
>The Liquidity Pool will operate like a pool on Uniswap V3. It adopts the product model, i.e. x*y=k, where x and y are the balances of the two tokens in the swap pair. For each swap, transaction fees will be 0.4%.


However, even if a Timelock cannot be parallelized by a CPU, an FPGA or ASIC could decrypt a Timelock 100 or even 1000 times faster than a cpu. So in a real liquidity pool, the owner of the contract would have to put a decryptable Timelock on a long length in case someone came to decrypt the Timelocks to frontrun the transactions. In this way, the owner himself would need an FPGA to unlock the Timelocks the Timelocks of those who forgot or didn't want to do it.
