requires "../rules.k"
requires "../bin_runtime.k"

module 6F631DE8D83E5CE1D204B1E679ADD253CE3A9EE411EC40FF217C6E21CD5EA682
  imports ETHEREUM-SIMULATION
  imports EVM
  imports RULES
  imports BIN_RUNTIME

// StandardToken_transferFrom
rule [StandardToken.transferFrom.pass.rough]:
  <k> #execute ~> CONTINUATION => #halt ~> CONTINUATION </k>
  <exit-code> 1 </exit-code>
  <mode> NORMAL </mode>
  <schedule> PETERSBURG </schedule>
  <ethereum>
    <evm>
      <output> _ => #asByteStackInWidthaux(1, 31, 32, .WordStack) </output>
      <statusCode> _ => EVMC_SUCCESS </statusCode>
      <callStack> VCallStack </callStack>
      <interimStates> _ </interimStates>
      <touchedAccounts> _ => _ </touchedAccounts>
      <callState>
        <program> #asMapOpCodes(#dasmOpCodes(StandardToken_bin_runtime, PETERSBURG)) </program>
        <programBytes> StandardToken_bin_runtime </programBytes>
        <id> ACCT_ID </id>
        <caller> CALLER_ID </caller>
        <callData> #abiCallData("transferFrom", #address(ABI_from), #address(ABI_to), #uint256(ABI_value)) ++ CD => _ </callData>
        <callValue> VCallValue </callValue>
        <wordStack> .WordStack => _ </wordStack>
        <localMem> .Map => _ </localMem>
        <pc> 0 => _ </pc>
        <gas> VGas => _ </gas>
        <memoryUsed> 0 => _ </memoryUsed>
        <callGas> _ => _ </callGas>
        <static> false </static>
        <callDepth> VCallDepth </callDepth>
      </callState>
      <substate>
        <selfDestruct> VSelfDestruct </selfDestruct>
        <log> _ => VLog </log>
        <refund> _ => VRefund </refund>
      </substate>
      <gasPrice> _ </gasPrice>
      <origin> ORIGIN_ID </origin>
      <previousHash> _ </previousHash>
      <ommersHash> _ </ommersHash>
      <coinbase> _ </coinbase>
      <stateRoot> _ </stateRoot>
      <transactionsRoot> _ </transactionsRoot>
      <receiptsRoot> _ </receiptsRoot>
      <logsBloom> _ </logsBloom>
      <difficulty> _ </difficulty>
      <number> _ </number>
      <gasLimit> _ </gasLimit>
      <gasUsed> _ </gasUsed>
      <timestamp> TIME </timestamp>
      <extraData> _ </extraData>
      <mixHash> _ </mixHash>
      <blockNonce> _ </blockNonce>
      <ommerBlockHeaders> _ </ommerBlockHeaders>
      <blockhash> _ </blockhash>
    </evm>
    <network>
      <activeAccounts> SetItem(ACCT_ID)
      SetItem(1)
      SetItem(2)
      SetItem(3)
      SetItem(4)
      SetItem(5)
      SetItem(6)
      SetItem(7)
      SetItem(8) _ </activeAccounts>
      <accounts>
        <account>
          <acctID> ACCT_ID </acctID>
          <balance> ACCT_ID_balance </balance>
          <code> StandardToken_bin_runtime </code>
          <storage>         
           .Map 
          [#StandardToken.balances[ABI_from] <- (FromBal                                                         => FromBal -Int ABI_value)]        
          [#StandardToken.balances[ABI_to] <- (ToBal                                                           => ToBal +Int ABI_value)]        
          [#StandardToken.approvals[ABI_from][CALLER_ID] <- (Approval                                                        => Approval -Int ABI_value)]        
          [#StandardToken.filler_fillerr_paused_fillerrr <- (#WordPackUInt8UInt8UInt8Addr(Filler, Fillerr, Paused, Fillerrr) => #WordPackUInt8UInt8UInt8Addr(Filler, Fillerr, Paused, Fillerrr))]
            _:Map 
           </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 1 </acctID>
          <balance> ECREC_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 2 </acctID>
          <balance> SHA256_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 3 </acctID>
          <balance> RIP160_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 4 </acctID>
          <balance> ID_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 5 </acctID>
          <balance> MODEXP_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 6 </acctID>
          <balance> ECADD_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 7 </acctID>
          <balance> ECMUL_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
        <account>
          <acctID> 8 </acctID>
          <balance> ECPAIRING_BAL </balance>
          <code> .WordStack </code>
          <storage> _:Map </storage>
          <origStorage> _ </origStorage>
          <nonce> _ </nonce>
        </account>
       ... 
      </accounts>
      <txOrder> _ </txOrder>
      <txPending> _ </txPending>
      <messages> _ </messages>
    </network>
  </ethereum>
requires #rangeAddress(ACCT_ID)
andBool #notPrecompileAddress(ACCT_ID)
andBool #rangeAddress(CALLER_ID)
andBool #rangeAddress(ORIGIN_ID)
andBool #rangeUInt(256, TIME)
andBool #rangeUInt(256, ACCT_ID_balance)
andBool #rangeUInt(256, ECREC_BAL)
andBool #rangeUInt(256, SHA256_BAL)
andBool #rangeUInt(256, RIP160_BAL)
andBool #rangeUInt(256, ID_BAL)
andBool #rangeUInt(256, MODEXP_BAL)
andBool #rangeUInt(256, ECADD_BAL)
andBool #rangeUInt(256, ECMUL_BAL)
andBool #rangeUInt(256, ECPAIRING_BAL)
andBool VCallDepth <=Int 1024
andBool #rangeUInt(256, VCallValue)

  andBool (#rangeAddress(ABI_from)
  andBool (#rangeAddress(ABI_to)
  andBool (#rangeUInt(256, ABI_value)
  andBool (#rangeUInt(256, Approval)
  andBool (#rangeUInt(256, FromBal)
  andBool (#rangeUInt(256, ToBal)
  andBool (#rangeUInt(8, Paused)
  andBool (#rangeUInt(8, Filler)
  andBool (#rangeUInt(8, Fillerr)
  andBool (#rangeAddress(Fillerrr)
  andBool ((#sizeWordStack(CD) <=Int 1250000000)
  andBool ((#notPrecompileAddress(Fillerrr))
  andBool ((ABI_from =/=Int ABI_to)
  andBool (VGas >=Int 3000000
  andBool (((#rangeUInt(256, FromBal -Int ABI_value)))
  andBool (((#rangeUInt(256, ToBal +Int ABI_value)))
  andBool (((#rangeUInt(256, Approval -Int ABI_value)))
  andBool ((Paused ==Int 0)
  andBool ((VCallValue ==Int 0)
  andBool ((ABI_to =/=Int 0))))))))))))))))))))) 

endmodule
