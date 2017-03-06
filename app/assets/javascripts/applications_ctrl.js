$(document).ready(function() {
  new Vue({
    el: '#applications-index',
    data: {
      applications: [],
      sortOrder: "desc",
      searchField: ""
    },
    mounted: function() {
      var that;
      that = this;
      $.ajax({
        url: '/api/v1/users/' + gon.user_id +'/applications.json',
        success: function(response) {
          that.applications = response;
        }
      })
    },
    computed: {
      tableFilter: function () {
        return this.findBy(this.applications, this.searchField, ['company', 'job_title', 'notes', 'current_step' ])
      }
    },
    methods: {
      orderByField: function(field) {
        this.toggleSortOrder();
        if (this.sortOrder === "desc") {
          this.applications = _.orderBy(this.applications, [application => application[field].toLowerCase()], ['desc']);
        } else {
          this.applications = _.orderBy(this.applications, [application => application[field].toLowerCase()], ['asc']);
        }
          return this.applications;
      },
      toggleSortOrder: function() {
        if (this.sortOrder === "desc"){
          this.sortOrder = "asc";
        } else {
          this.sortOrder = "desc";
        }
      },
      findBy: function (list, value, column) {
        return list.filter(function (item) {
          var searchMatch = false;

          for(var i = 0; i < column.length; i++) {
            var itemAttribute = column[i];
            var result = item[itemAttribute].toLowerCase().indexOf(value.toLowerCase()) !== -1;
            if(result) {
              searchMatch = true;
            }
          }
          return searchMatch;
        })
      },
      viewUrlBuilder: function(applicationId) {
        return "/users/" + gon.user_id + "/applications/" + applicationId;
      },
      editUrlBuilder: function(applicationId) {
        return "/users/" + gon.user_id + "/applications/" + applicationId +"/edit";
      }
    }
  })
})
