const allStar1 = document.querySelectorAll('.time_rating .star')
const ratingValue1 = document.querySelector('.time_rating input')

allStar1.forEach((item, idx)=> {
	item.addEventListener('click', function () {
		let click = 0
		ratingValue1.value = idx + 1
		console.log(ratingValue1.value)

		allStar1.forEach(i=> {
			i.classList.replace('bxs-star', 'bx-star')
			i.classList.remove('active')
		})
		for(let i=0; i<allStar1.length; i++) {
			if(i <= idx) {
				allStar1[i].classList.replace('bx-star', 'bxs-star')
				allStar1[i].classList.add('active')
			} else {
				allStar1[i].style.setProperty('--i', click)
				click++
			}
		}
	})
})

const allStar2 = document.querySelectorAll('.item_rating .star')
const ratingValue2 = document.querySelector('.item_rating input')

allStar2.forEach((item, idx)=> {
	item.addEventListener('click', function () {
		let click = 0
		ratingValue2.value = idx + 1
		console.log(ratingValue2.value)

		allStar2.forEach(i=> {
			i.classList.replace('bxs-star', 'bx-star')
			i.classList.remove('active')
		})
		for(let i=0; i<allStar2.length; i++) {
			if(i <= idx) {
				allStar2[i].classList.replace('bx-star', 'bxs-star')
				allStar2[i].classList.add('active')
			} else {
				allStar2[i].style.setProperty('--i', click)
				click++
			}
		}
	})
})