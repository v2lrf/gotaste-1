import React, { Fragment, useState } from 'react'
import ReactRater from 'react-rater'
import 'react-rater/lib/react-rater.css'

const Rater = () => {
  const [rating, setRating] = useState(1)

  return (
    <Fragment>
      <ReactRater
        total={5}
        rating={4.5}
        onRate={event => setRating(event.rating)}
      />

      <input
        type="hidden"
        name="review[rating]"
        id="review_rating"
        value={rating}
      />
    </Fragment>
  )
}

export default Rater
