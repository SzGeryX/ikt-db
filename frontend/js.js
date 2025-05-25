let suspectSec = document.getElementById("suspect")
let detectiveSec = document.getElementById("detective")

fetch("http://127.0.0.1:3000/suspects")
  .then(res => res.json())
  .then(data => {
      data.forEach(element => {
        card = document.createElement("div") 
        card.classList.add("card")

        sname = document.createElement("h1")
        sname.innerText = element.name

        age = document.createElement("p")
        age.innerText = "Age: " + element.age

        height = document.createElement("p")
        height.innerText = "Height: " + element.height

        hairColor = document.createElement("p")
        hairColor.innerText = "Hair color: " + element.hairColor

        eyeColor = document.createElement("p")
        eyeColor.innerText = "Eye color: " + element.eyeColor

        married = document.createElement("p")
        married.innerText = `Married: ${element.married ? "Yes" : "No"}`

        card.appendChild(sname)
        card.appendChild(age)
        card.appendChild(height)
        card.appendChild(eyeColor)
        card.appendChild(hairColor)
        card.appendChild(married)

        suspectSec.appendChild(card)        

      });
  })

fetch("http://127.0.0.1:3000/detectives")
  .then(res => res.json())
  .then(data => {
      data.forEach(element => {
        card = document.createElement("div") 
        card.classList.add("card")

        dname = document.createElement("h1")
        dname.innerText = element.name

        experience = document.createElement("p")
        experience.innerText = "Exprience: " + element.experience

        birthYear = document.createElement("p")
        birthYear.innerText = "Birth year: " + element.birthYear

        card.appendChild(dname)
        card.appendChild(experience)
        card.appendChild(birthYear)

        detectiveSec.appendChild(card)        

      });

  })