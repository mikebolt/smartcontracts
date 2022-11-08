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