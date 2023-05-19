window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;//価格を取得
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)//価格*0.1を表示する
  const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue * ( 1 - 0.1 ))//価格*(1-0.1)を表示する
})
});