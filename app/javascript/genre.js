window.addEventListener('turbo:load', function () {
  const parentGenre = document.getElementById('parent-genre');
  const selectWrap = document.getElementById('select-wrap');

  const selectChildElement = (selectForm) => {
    if (document.getElementById(selectForm) !== null) {
      document.getElementById(selectForm).remove();
    }
  };

  const XHR = new XMLHttpRequest();
  const genreXHR = (id) => {
    XHR.open("GET", `/dresses/${id}/genre`, true);
    XHR.responseType = "json";
    XHR.send();
  };

  const getChildGenreData = () => {
    const parentValue = parentGenre.value;
    genreXHR(parentValue);
  };

  XHR.onload = () => {
    const items = XHR.response.item;
    updateChildSelect(items);
  };

  const updateChildSelect = (items) => {
    selectChildElement('child-select-wrap');
    if (items.length > 0) {
      appendChildSelect(items, selectWrap);
    }
  };

  const appendChildSelect = (items, parentElement) => {
    const childWrap = document.createElement('div');
    const childSelect = document.createElement('select');

    childWrap.setAttribute('id', 'child-select-wrap');
    childWrap.classList.add('dress-form'); // クラス名を追加
    childSelect.setAttribute('id', 'child-select');

    items.forEach(item => {
      const childOption = document.createElement('option');
      childOption.innerHTML = item.name;
      childOption.setAttribute('value', item.id);
      childSelect.appendChild(childOption);
    });

    childWrap.appendChild(childSelect);
    parentElement.appendChild(childWrap);
  };

  parentGenre.addEventListener('change', function () {
    selectChildElement('child-select-wrap');
    getChildGenreData();
  });

  // 初期状態で子要素プルダウンを非表示にする
  updateChildSelect([], selectWrap);
});
