import {Datatable} from "../../../resources/components/datatable/datatable.js";

let page = new URL(window.location.href).searchParams.get('page');
let id = "cart"
let products = new Datatable(id, page);

$(document).ready(function() {
    // Initialize
    products.clear();
    products.rendering("no", 1);

    // Sort by Column
    $('div.data-table#'+id+' th#name').click(function() {products.sort_by_column("name")});
    $('div.data-table#'+id+' th#price').click(function() {products.sort_by_column("price")});
    $('div.data-table#'+id+' th#amount').click(function() {products.sort_by_column("views")});
    $('div.data-table#'+id+' th#amountPrice').click(function() {products.sort_by_column("amountPrice")});
})

$(document).on('click', '#'+id+' tbody tr', function(row) {
    let no = $(this).attr('no');
    location.href = '/'+id+'/view?no='+no;
})
