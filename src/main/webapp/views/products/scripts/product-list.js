// import {Datatable} from "../../../resources/components/datatable/datatable.js";
import {TileList} from "../../../resources/components/tile/list.js";

let id = "products"
let products = new TileList(id, 1);

$(document).ready(function() {
    products.init();
    $('#more').click(function() {
        products.update();
    })
})