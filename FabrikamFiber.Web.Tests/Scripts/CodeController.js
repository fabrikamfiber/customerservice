var custLib = {
	ticketCount: function(c)
	{
		var count = 0;

		for (var i = 0; i < c.length; i++) {
			count += c[i].outstandingTickets;
		}

		return count;
	},

	totalAMC: function (c) {
		var amount = 0;

		for (var i = 0; i < c.length; i++) {
			amount += c[i].amcamount;
		}

		return amount;
	},

	totalBaseDiscount: function (c) {
		var amount = 0;

		for (var i = 0; i < c.length; i++) {
			amount += c[i].baseDiscount;
		}

		return amount;
	},

	totalVolumeDiscount: function (c) {
		var amount = 0;

		for (var i = 0; i < c.length; i++) {
			amount += c[i].volumeDiscount;
		}

		return amount;
	},
}
