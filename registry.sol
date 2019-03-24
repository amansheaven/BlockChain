pragma solidity ^0.4.0;

contract Owned {
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}


contract registry is Owned{
    
    
    struct land{
        
        string own_name;
        string own_id;
        string passcode;
        string p_type;
        string p_address;
        uint p_size;
        string p_uni;
        address owner;
    }    
     
    // function registry() public{
    //      owner = msg.sender;
    //  }
    mapping(address => land) city;
    
    address[] public land_arr;
    
    function setland(address _addr, string memory _name, string memory _id, string memory _pass, string memory _type, string memory _address, uint256 _size, string memory _uni) public {
        var land_temp = city[(_addr)];
        land_temp.own_name = _name;
        land_temp.own_id = _id;
        land_temp.passcode = _pass;
        land_temp.p_type = _type;
        land_temp.p_address = _address;
        land_temp.p_size =(_size);
        land_temp.p_uni = _uni;
        
        land_arr.push(_addr) -1;
        
    }
    
    function getlands() view public returns (address[]){
        return land_arr;
    }
    
    function getland(address inp) view public returns (string, string, string, string, string, uint, string){
        return (
            city[inp].own_name,
        city[inp].own_id,
        city[inp].passcode,
        city[inp].p_type,
        city[inp].p_address,
        city[inp].p_size,
        city[inp].p_uni
            );
    }
    
    function editland(address inp, string memory _name, string memory _id, string memory _pass, string memory _type, string memory _address, uint256 _size, string memory _uni ) public {
        
        city[inp].own_name = _name;
        city[inp].own_id = _id;
        city[inp].passcode = _pass;
        city[inp].p_type = _type;
        city[inp].p_address = _address ;
        city[inp].p_size = _size;
        city[inp].p_uni = _uni;
        
    }
    
    
    struct trans {
        string from_id;
        string to_id;
        string land_uni;
        string amount;
    }
    
    
    
    mapping(address => trans) log;
    
    address[] public trasc_log;
    
    
    
    
    // function transfer(address from_inp, uint256 amt, address to_trans , string from_pass, string to_pass) public returns(string){
    //     // if ((city[from_inp].passcode == from_pass) && (city[to_trans].passcode == to_pass)){
            
    //     // }
    
    //     // if (keccak256(abi.encodePacked((city[from_inp].passcode)) == keccak256(abi.encodePacked((from_pass)))) && keccak256(abi.encodePacked((city[to_trans].passcode)) == keccak256(abi.encodePacked((to_pass))))) 
    //     // {
            
    //     // }
        
        
    //     if((keccak256(city[from_inp].passcode) == keccak256(from_pass)) &&( keccak256(city[to_trans].passcode) == keccak256(to_pass)))
    //     {
    //         editland(from_inp,city[to_pass].own_name,city[to_pass].own_id,city[to_pass].passcode,city[to_pass].p_type,city[to_pass].p_address,city[to_pass].p_size,city[to_pass].p_uni);
    //     }
        
    // }

    
}
