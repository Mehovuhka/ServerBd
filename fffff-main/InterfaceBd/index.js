async function getTable() {
  const butGetTable = document.querySelector(".but-get-table");
  const bodyApp = document.querySelector(".App");
  const text = document.createElement("span");
  bodyApp.append(text);
  const requestOptions = {
    method: "GET",
    redirect: "follow",
  };
  butGetTable.addEventListener("click", async () => {
    let ggg;
    const nameTable = document.querySelector(".inp-table-get").value.trim();
    await fetch(`http://localhost:5000/get/${nameTable}`, requestOptions)
      .then((response) => response.text())
      .then((result) => (ggg = JSON.parse(result)))
      .catch((error) => console.log("error", error));

    const divInfo = document.querySelector(".div-with-info");
    ggg.forEach((element) => {
      let span = document.createElement("p");
      element = Object(element);
      console.dir(Object.values(element));
      span.textContent = Object.values(element).map((element) => {
        return `${element} \n\n\n\n\n`;
      });
      divInfo.append(span);
    });
  });
}
getTable();

async function postInTable() {
  const butGetPost = document.querySelector(".but-post-table");
  const requestOptionsGet = {
    method: "GET",
    redirect: "follow",
  };
  let fios, books
  await fetch("http://localhost:5000/get/fioReaders", requestOptionsGet)
  .then((response) => response.text())
  .then((result) => (fios = JSON.parse(result)))
  .catch((error) => console.log("error", error));
  console.log(fios)
  let selectFio = document.querySelector('.select-fio')
  fios.forEach(element => {
    let optionF = document.createElement("option")
    optionF.value = element.id_reader
    optionF.textContent = element.fio
    selectFio.append(optionF)
  });
  await fetch("http://localhost:5000/get/titleBook", requestOptionsGet)
  .then((response) => response.text())
  .then((result) => (books = JSON.parse(result)))
  .catch((error) => console.log("error", error));
  console.log(books)
  let selectBooks = document.querySelector('.select-bookname')
  books.forEach(element => {
    let optionB = document.createElement("option")
    optionB.value = element.id_book
    optionB.textContent = element.title
    selectBooks.append(optionB)
  });
  console.log(new Date().toJSON().slice(0,10));
  let today = new Date()
  let nowToday = today.toJSON().slice(0,10)
  butGetPost.addEventListener("click", async () => {
    console.log("111");
    const inpAmount = document.querySelector(".inp-amount").value.trim();
    console.log(selectBooks.value);
    console.log(selectFio.value);
    
    const raw = JSON.stringify({
      "id_book": selectBooks.value,
      "id_reader": selectFio.value,
      "amount": inpAmount,
      "date_out": nowToday ,
      "date_in": nowToday ,
    });
    console.log(raw);

    const requestOptionsPost = {
      method: "POST",
      body: raw,
      redirect: "follow",
    };
    await fetch("http://localhost:5000/post/historymovebooks", requestOptionsPost)
      .then((response) => response.text())
      .then((result) => console.log(result))
      .catch((error) => console.log("error", error));
  });
}
postInTable();

async function returnBook(){
  const butUpdate = document.querySelector('.but-update-table')
  butUpdate.addEventListener("click", async()=>{
    let IdMove = document.querySelector(".inp-update").value.trim()
    const raw = JSON.stringify({
      "amount": 0
    });
    const requestOptionsPut = {
      method: 'PUT',
      body: raw,
      redirect: 'follow'
    };
    await fetch(`http://localhost:5000/update/historymovebooks/${IdMove}`, requestOptionsPut)
      .then(response => response.text())
      .then(result => console.log(result))
      .catch(error => console.log('error', error));
  })
}
returnBook()