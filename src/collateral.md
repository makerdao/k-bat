```act
behaviour transferFrom of StandardToken
interface transferFrom(address from, address to, uint256 value)

types
  Approval : uint256
  FromBal  : uint256
  ToBal    : uint256
  Paused   : uint8
  Filler   : uint8
  Fillerr  : uint8
  Fillerrr : address

storage
  balances[from]             |-> FromBal => FromBal - value
  balances[to]               |-> ToBal => ToBal + value
  approvals[from][CALLER_ID] |-> Approval => Approval - value
  filler_fillerr_paused_fillerrr |-> #WordPackUInt8UInt8UInt8Addr(Filler, Fillerr, Paused, Fillerrr)

iff in range uint256
  FromBal - value
  ToBal + value
  Approval - value

iff
  Paused == 0
  VCallValue == 0
  to =/= 0

if
  from =/= to

returns 1
```

```act
behaviour transfer of StandardToken
interface transfer(address _to, uint256 _value)

types
  FromBal : uint256
  ToBal   : uint256

storage
  balances[CALLER_ID] |-> FromBal => FromBal - _value
  balances[_to]       |-> ToBal => ToBal + _value

iff
  VCallValue == 0

if
  FromBal >= _value
  _value > 0
  CALLER_ID =/= _to

returns 1 
```
