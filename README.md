# mikebolt/smartcontracts

Miscellaneous small smart contracts.

UNTESTED

NO WARRANTY

## RedirectableAddress

A user can send ether to this contract so that it will be redirected to an address chosen by the owner.
The chosen recipient address can be changed at any time by the owner. The contract holds the ether until
someone calls withdrawEther or the owner calls setRecipient.

Anyone sending ether to this contract should fully trust the owner, because the recipient address could
change momentarily before sending a transaction.

If the recipient address is a contract which fails in its receive function then both setRecipient and
withdrawEther can fail. This means that if you set a recipient address that is a contract that your
RedirectableAddress contract could get stuck forever. So, do this at your own risk.

TODO this contract could also support individual ERC20 tokens, but they would have to be preconfigured
at the time of contract creation so that the tokens paid out by setRecipient are always the same as
the tokens paid out by withdrawTokens. Otherwise tokens would not be sent to the correct recipient
without some expensive record keeping.

## SemiPrivate

This contract encodes an address so that the address is not in the contract's
memory, but instead the contract stores a hashed version of the address. Then
it can be checked later by performing the same hash. If someone checks every
known ethereum address then they could figure out which one it is. It would
only take a few seconds to compute. However, I think if it's an unknown address
that hasn't made any transactions yet, then it would be private because it uses
a secure hash function. But it would only be private until that account makes
its first transaction.
