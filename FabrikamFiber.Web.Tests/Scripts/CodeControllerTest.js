/// <reference path="CodeController.js" />
/// <reference path="jasmine.js" /> 


describe("custLib", function () {
	var cust = [
		{ name: "Fabrigaz",            outstandingTickets:  0, amcamount: 15000, baseDiscount: 25, volumeDiscount: 40 },
		{ name: "Planetory Solutions", outstandingTickets:  1, amcamount: 15000, baseDiscount: 25, volumeDiscount: 40 },
		{ name: "Tailspin Toys",       outstandingTickets:  3, amcamount: 15000, baseDiscount: 25, volumeDiscount: 40 },
		{ name: "Acme",                outstandingTickets: 15, amcamount: 10000, baseDiscount: 25, volumeDiscount: 40 },
		{ name: "FiberWeb",            outstandingTickets:  6, amcamount: 10000, baseDiscount: 25, volumeDiscount: 40 },
	];

	it("will check for total outstanding tickets", function () {
		var res = custLib.ticketCount(cust);
		expect(res).toEqual(25);
	});

	it("will check for total amc amount", function () {
		var res = custLib.totalAMC(cust);
		expect(res).toEqual(65000);
	});

	it("will check for total base discount", function () {
		var res = custLib.totalBaseDiscount(cust);
		expect(res).toEqual(125);
	});

	it("will check for total volume discount", function () {
		var res = custLib.totalVolumeDiscount(cust);
		expect(res).toEqual(200);
	});
});
