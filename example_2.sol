// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Data {
    struct FogNode {
        //Ethereumアドレス
        address ead;
        //ユニークID EAD同様42桁の英数字
        string uid;
    }
    struct IoT {
        //ユニークID EAD同様42桁の英数字
        string uid;
    }
    struct Pair {
        //ユニークID EAD同様42桁の英数字
        string fognodeUid;
        //ユニークID EAD同様42桁の英数字
        string iotUid;
    }
    
    //関数外に宣言しているのでブロックチェーンに書き込まれる storage扱い
    FogNode[] fognode;
    IoT[] iot;
    Pair[] pair;
    
    
    function setFogNode(address _address, string memory _string) private {
        fognode.push(FogNode(_address, _string));
    }
    
    function setIot(string memory _string) private {
        iot.push(IoT(_string));
    }
    
    function isIotUid(string memory _string) public view returns (bool) {
        bool boolean;
        for(uint i = 0; i < iot.length; i++) {
            boolean = keccak256(abi.encode(_string)) == keccak256(abi.encode(iot[i].uid));
            if (boolean) return true;
        }
        return false;
    }
    
    function setPair(string memory _fognodeUid, string memory _iotUid) private {
        pair.push(Pair(_fognodeUid, _iotUid));
    }
}