export class Datatable {
    constructor(id, page) {
        this.id = id;
        this.page = page;
        this.body = $('div.data-table#'+id+" tbody");
        this.headers = $('div.data-table#'+id+" th");
    }

    set setSort(sort) { this.sort = sort; }
    set setDir(dir) { this.dir = dir; }

    getList() {
        let result;
        let query = '/'+this.id+'/list.do?page='+ this.page
            + '&sort=' + this.sort + '&dir=' + this.dir;
        $.ajax({
            async: false,
            type: 'POST',
            url: query,
            dataType: 'json',
            success:function(data) {
                result = data;
            }
        })

        return result;
    }

    rendering(sort, dir) {
        // Data ready
        this.setSort = sort;
        this.setDir  = dir;
        let list = this.getList();

        // Get Available Column keys and classes
        let keys = [];
        for (let i = 0; i < this.headers.length; i++) {
            keys.push(this.headers[i].id);
        }
        let classes = [];
        for (let i = 0; i < this.headers.length; i++) {
            classes.push(this.headers[i].className);
        }

        // Draw Table
        // console.log(list);
        let table = [];
        if (list == null && list.length == 0) return;
        list.forEach(function(row, i) {
            let row_str = "<tr no='"+row["no"]+"'>";
            let row_data= new Array(keys.length);
            for(let j in row) {
                let index = $.inArray(j, keys);
                if (index != -1) {
                    let col = row[j];
                    row_data[index] =
                        "<td class='col-"+keys[index]+" "
                        + classes[index]+"'>"
                        + col + "</td>";
                }
            }

            row_str += row_data;
            row_str += "</tr>";
            table += row_str;
        })

        // console.log(table);
        this.body.append(table);
    }

    clear() {
        this.body.children().remove();
    }

    sort_by_column(column) {
        this.clear();
        let header = this.headers.parent().find("th#"+column);
        let sort = header.attr('sort');
        if (sort == null || sort == undefined) sort = 1;

        this.rendering(column, sort);
        if (sort == 1) header.attr('sort', "-1");
        else header.attr('sort', "1");
    }


    // Region Execution
    init() {
        this.clear();
        this.rendering("no", 1);
    }

    header_sort() {
        let table = this;
        this.headers.on('click', function() {
            let id = this["id"];
            if (id == "rn") return;
            table.sort_by_column(id);
        })
    }

    row_view() {
        let id = this.id;
        this.body.on('click', 'tr', function() {
            let no = $(this).attr('no');
            location.href = '/'+id+'/view?no='+no;
        })
    }
    // End Region Execution
}
