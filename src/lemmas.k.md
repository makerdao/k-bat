```k
//Vat.addui
rule chop(A +Int #unsigned(B)) => A +Int B
  requires #rangeUInt(256, A)
  andBool #rangeSInt(256, B)
  andBool #rangeUInt(256, A +Int B)

rule chop(A +Int (pow256 +Int B)) <Int A => 0 <=Int A +Int B
  requires #rangeUInt(256, A)
  andBool #rangeSInt(256, B)
  andBool B <Int 0
```
