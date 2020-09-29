document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  document.addEventListener("DOMContentLoaded",()=>{
    const toggleLi=(e)=>{
      const li=e.target;
      if(li.className==="visited")
        {li.className="";}
      else{li.className="visited";}
    };
  })
  // --- your code here!

  document.querySelectorAll("#restaurants li").forEach((li)=>{
    li.addEventListener("click",toggleLi);});
    const handleFavoriteSubmit=(e)=>{
      e.preventDefault();
      const favoriteInput=document.querySelector(".favorite-input");
      const favorite=favoriteInput.value;favoriteInput.value="";
    }
  })

  // adding new photos

  // --- your code here!



});
