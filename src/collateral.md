Transfer Success
```act
behaviour transfer of StandardToken
interface transfer(address _to, uint256 _value)

types
  FromBal : uint256
  ToBal   : uint256

storage
  balances[CALLER_ID] |-> FromBal => FromBal - _value
  balances[_to]       |-> ToBal => ToBal + _value

iff in range uint256
  FromBal - _value
  ToBal + _value

iff
  VCallValue == 0

if
  FromBal >= _value
  _value > 0
  CALLER_ID =/= _to

returns 1 
```

Transfer Fail
```act
behaviour transfer_fail of StandardToken
interface transfer(address _to, uint256 _value)

types
  FromBal : uint256
  ToBal   : uint256

storage
  balances[CALLER_ID] |-> FromBal => FromBal - _value
  balances[_to]       |-> ToBal => ToBal + _value

iff in range uint256
  FromBal - _value
  ToBal + _value

iff
  VCallValue == 0

if
  (FromBal < _value or _value == 0)
  CALLER_ID =/= _to

returns 0
```

TransferFrom Pass
```act
behaviour transferFrom of StandardToken
interface transferFrom(address from, address to, uint256 value)

types
  Approval : uint256
  FromBal  : uint256
  ToBal    : uint256

storage
  balances[from]             |-> FromBal => FromBal - value
  balances[to]               |-> ToBal => ToBal + value
  approvals[from][CALLER_ID] |-> Approval => Approval - value

iff in range uint256
  FromBal - value
  ToBal + value
  Approval - value

iff
  VCallValue == 0

if
  FromBal >= value
  Approval >= value
  value > 0
  CALLER_ID =/= to
  from =/= to

returns 1
```
TransferFrom Fail
```act
behaviour transferFrom_fail of StandardToken
interface transferFrom(address from, address to, uint256 value)

types
  Approval : uint256
  FromBal  : uint256
  ToBal    : uint256

storage
  balances[from]             |-> FromBal => FromBal - value
  balances[to]               |-> ToBal => ToBal + value
  approvals[from][CALLER_ID] |-> Approval => Approval - value

iff in range uint256
  FromBal - value
  ToBal + value
  Approval - value

iff
  VCallValue == 0

if
  (FromBal < value or Approval < value or value == 0)
  CALLER_ID =/= to
  from =/= to

returns 0
```

Vat acts
```act
behaviour slip of Vat
interface slip(bytes32 ilk, address usr, int256 wad)

for all
  May : uint256
  Gem : uint256

storage
  wards[CALLER_ID] |-> May
  gem[ilk][usr]    |-> Gem => Gem + wad

iff
  May == 1
  VCallValue == 0

iff in range uint256
  Gem + wad

calls
  Vat.addui
```

```act
behaviour addui of Vat
interface add(uint256 x, int256 y) internal

stack
  #unsigned(y) : x : JMPTO : WS => JMPTO : x + y : WS

iff in range uint256
  x + y

if
  #sizeWordStack(WS) <= 1015
```