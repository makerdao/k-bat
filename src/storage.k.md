Storage for BAT
```k
syntax Int ::= "#StandardToken.balances" "[" Int "]" [function]
rule #StandardToken.balances[A] => #hashedLocation("Solidity", 1, A)

syntax Int ::= "#StandardToken.approvals" "[" Int "]" "[" Int "]" [function]
rule #StandardToken.approvals[A][B] => #hashedLocation("Solidity", 2, A B)
```

Storage for Vat
```k
syntax Int ::= "#Vat.wards" "[" Int "]" [function]
rule #Vat.wards[A] => #hashedLocation("Solidity", 0, A)

syntax Int ::= "#Vat.gem" "[" Int "]" "[" Int "]" [function]
rule #Vat.gem[Ilk][Usr] => #hashedLocation("Solidity", 4, Ilk Usr)
```
