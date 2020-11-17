window.addEventListener('load', () => {

 const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue / 10);
    const pay = inputValue - tax;
    
    const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = tax;
    const addPayDom = document.getElementById("profit");
      addPayDom.innerHTML = pay;
})


});