export class TileList {
    constructor(id, page) {
        this.id = id;
        this.page = page;
        this.template = $('.tile.template');
        this.body = this.template.parent();
        this.template.remove();
    }

    set setSort(sort) { this.sort = sort; }
    set setDir(dir) { this.dir = dir; }

    getList(page) {
        let result;
        let query = '/'+this.id+'/list.do?page='+ page
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
        let body = this.body;
        body.css('flex-wrap', 'wrap');
        let template = this.template;
        // Data ready
        this.setSort = sort;
        this.setDir  = dir;
        let id = this.id;

        let list = this.getList(this.page);


        let i = 0;
        function draw() {
            if (i >= list.length) return;
            let row  = list[i];
            let tile = template.clone();

            tile.find('.value').each(function() {
                if (this.tagName == 'INPUT') this.value = row[this.id];
                else if (this.tagName == 'IMG') this.src = '/'+id+'/load.do?filename='+row[this.id];
                else this.textContent = row[this.id];
            });
            tile.find('button').each(function() {
                this.onclick = function() {
                    location.href=this.getAttribute('goto') +'?no='+row["no"]};
            })

            i++;
            body.append(tile);
            setTimeout(draw, 300);
        }

        draw();
    }

    init() {
        this.rendering("no", 1);
    }

    update() {
        this.page++;
        this.rendering("no", 1)
    }
}