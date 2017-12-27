(function() {

    var db = {

        loadData: function(filter) {
            return $.grep(this.clients, function(client) {
                return (!filter.entityDesc || client.entityDesc.indexOf(filter.entityDesc) > -1)
                    && (!filter.sid || client.sid === filter.sid)
                    && (!filter.brandName || client.brandName.indexOf(filter.brandName) > -1)
                    && (!filter.brandNamePinyin || client.brandNamePinyin === filter.brandNamePinyin)
                    && (filter.businessLog === undefined || client.businessLog === filter.businessLog);
            });
        },

        insertItem: function(insertingClient) {
            this.clients.push(insertingClient);
        },

        updateItem: function(updatingClient) { },

        deleteItem: function(deletingClient) {
            var clientIndex = $.inArray(deletingClient, this.clients);
            this.clients.splice(clientIndex, 1);
        }

    };

    window.db = db;


    db.countries = [
        { Name: "", Id: 0 },
        { Name: "United States", Id: 1 },
        { Name: "Canada", Id: 2 },
        { Name: "United Kingdom", Id: 3 },
        { Name: "France", Id: 4 },
        { Name: "Brazil", Id: 5 },
        { Name: "China", Id: 6 },
        { Name: "Russia", Id: 7 }
    ];

   

}());