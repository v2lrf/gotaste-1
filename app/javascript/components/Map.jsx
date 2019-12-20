import React, { useState } from 'react'
import ReactMapGL from 'react-map-gl'

const Map = ({ latitude, longitude }) => {
  const [viewport, setviewport] = useState({
    latitude,
    longitude,
    width: '100%',
    height: 200,
    zoom: 13,
    mapboxApiAccessToken: 'changeThis'
  })

  return (
    <div>
      <ReactMapGL {...viewport}>Markers hers</ReactMapGL>
    </div>
  )
}

export default Map
