// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

/*
 TODO:
    - check atr of mem
    - check atr of block
    - check other available objects
*/

contract Dappazon {
    address public owner;
    mapping(uint256 => Item) public items;
    mapping(address => uint256) public orderCount;
    mapping(address => mapping(uint256 => Order)) public orders;
    
    event List(string indexed name, uint256 indexed cost, uint256 stock);
    event Buy(address buyer, uint256 orderId, uint256 itemId);

    struct Item {
        uint256 id;
        string name; 
        string category;
        string image;
        uint256 cost;
        uint256 rating;
        uint256 stock;
    }

    struct Order {
        uint256 time;
        Item item;
    }

    constructor() {
        owner = msg.sender;
    }

    modifier mustBeOwner() {
        require(msg.sender == owner);
        _;
    }

    // List products
    function list(
        uint256 _id, 
        string memory _name, 
        string memory _category,
        string memory _image,
        uint256 _cost,
        uint256 _rating,
        uint256 _stock
    ) public mustBeOwner() {
        Item memory item = Item(_id, _name, _category, _image, _cost, _rating, _stock);
        items[_id] = item;

        emit List(_name, _cost, _stock);
    }

    // Buy product
    // Simply making it 'payable' allows us to do '.buy(ID, { value: COST } )' and send crypto to contract
    function buy(uint256 _id) public payable {
        Item memory item = items[_id];

        require(msg.value >= item.cost);

        require(item.stock > 0);

        Order memory order = Order(block.timestamp, item);
        orderCount[msg.sender]++;
        orders[msg.sender][orderCount[msg.sender]] = order;

        items[_id].stock--;

        emit Buy(msg.sender, orderCount[msg.sender], item.id);
    }
    
    // Withdraw funds
    function withdraw() public mustBeOwner() {
        (bool success,) = owner.call{value: address(this).balance}("");
        require(success);
    }
}

// import "forge-std/Test.sol";

// contract DappazonTest is Test {

//     event List(string indexed name, uint256 indexed cost, uint256 stock);

//     // Dappazon dappazon;

//     function setUp() public {
//         // dappazon = new Dappazon();
//     }

//     function test_List() public {
//         Dappazon dappazon = new Dappazon();
//         vm.expectEmit(true, true, false, false);
//         // The event we expect
//         // event List(string name, uint256 cost, uint256 stock);
//         emit List("name", 2, 4);
//         // The event we get
//         dappazon.list(1, "name", "category", "image", 2, 3, 4);
//     }
// }