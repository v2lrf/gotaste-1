import React from 'react'
import Rater from 'react-rater'
import 'react-rater/lib/react-rater.css'

const Rating = () => {
  return (
    <Rater total={5} rating={4.5} onRate={event => console.log(event.rating)} />
  )
}

export default Rating
