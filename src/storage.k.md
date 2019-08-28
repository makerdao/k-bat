```k
syntax Int ::= "#StandardToken.balances" "[" Int "]" [function]
rule #StandardToken.balances[A] => #hashedLocation("Solidity", 1, A)

syntax Int ::= "#StandardToken.approvals" "[" Int "]" "[" Int "]" [function]
rule #StandardToken.approvals[A][B] => #hashedLocation("Solidity", 2, A B)
```
