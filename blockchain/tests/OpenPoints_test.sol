pragma solidity ^0.5.1;

import "remix_tests.sol";
import "../contracts/OpenPoints.sol";

contract OpenPointsTest {

    OpenPoints s;
    function beforeAll () public {
        s = new OpenPoints();
    }

    function testGetInfo () public {
        Assert.equal(s.getInfo(), "Open points version 0.1.0", "VersionError: Invalid version");
    }

    function testMyPoints() public {
        Assert.equal(s.myPoints(), 0, "PointsError: Invalid points");
    }

    function testUserPoints() public {
        Assert.equal(s.userPoints(msg.sender), 0, "PointsError: Invalid points");
    }

    function testIssuePoints() public {
        s.issuePoint(msg.sender, 100);
        Assert.equal(s.userPoints(msg.sender), 100, "PointsError: Invalid points");
    }

    function testBurnPoints() public {
        s.burnPoint(msg.sender, 100);
        Assert.equal(s.userPoints(msg.sender), 0, "PointsError: Invalid points");
    }
    
    function testNegativeBurnPoints() public {
        (bool status, bytes memory _) = address(s).call(
             abi.encodePacked(s.burnPoint.selector,
             abi.encode(msg.sender, 1000))
        );
        require(status == false);
    }
}