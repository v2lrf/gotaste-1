import React, { Fragment } from 'react'
import PropTypes from 'prop-types'
import Gallery from '../Gallery'
import Map from '../Map'

const Place = ({ place }) => {
  const {
    images,
    name,
    category,
    latitude,
    longitude,
    address_1: address1,
    address_2: address2,
    phone_number: phoneNumber,
    description,
    area
  } = place

  return (
    <Fragment>
      <div className="w-full mb-4">
        <Gallery images={images} />
      </div>
      <div className="max-w-5xl mx-auto px-4">
        <div className="md:flex">
          <div className="w-full md:w-2/3">
            <div className="border-b border-gray-300 pb-4 mr-4">
              <h1 className="font-extrabold text-3xl md:text-4xl">{name}</h1>
              <div className="py-2">
                <i className="far fa-store-alt" />
                <span className="pl-2 font-medium">{category}</span>
              </div>

              <div className="py-4">
                <a
                  className="px-4 py-2 border mr-2 border-gray-400 rounded text-gray-600 text-sm font-semibold hover:shadow"
                  href="#"
                >
                  <i className="far fa-heart" />
                  <span className="pl-2">2</span>
                </a>

                <a
                  className="px-4 py-2 border mr-2 border-gray-400 rounded text-gray-600 text-sm font-semibold hover:shadow"
                  href="#"
                >
                  <i className="far fa-camera" />
                  <span className="pl-2">Tilføj billede</span>
                </a>

                <a
                  className="px-4 py-2 border mr-2 border-gray-400 rounded text-gray-600 text-sm font-semibold hover:shadow"
                  href="#"
                >
                  <i className="far fa-share" />
                  <span className="pl-2">Del</span>
                </a>
              </div>
            </div>

            <div className="border-b border-gray-300 py-4 mr-4">
              <h3 className="font-semibold text-lg pb-2">
                Lokalitet & åbningstider
              </h3>

              <div className="flex">
                <div className="w-1/2 pr-6">
                  <Map latitude={latitude} longitude={longitude} />
                  <p className="font-medium pt-4">{address1}</p>
                  <p className="font-medium">{address2}</p>
                  <p>{area}</p>
                </div>

                <div className="w-1/2">
                  <table>
                    <tbody>
                      <tr>
                        <th>man.</th>
                        <td>09:00-10:00</td>
                      </tr>

                      <tr>
                        <th>tirs.</th>
                        <td>
                          09:00-10:00
                          <span className="pl-2 text-green-600 font-semibold">
                            Åben nu
                          </span>
                        </td>
                      </tr>

                      <tr>
                        <th>ons.</th>
                        <td>09:00-10:00</td>
                      </tr>

                      <tr>
                        <th>tors.</th>
                        <td>09:00-10:00</td>
                      </tr>

                      <tr>
                        <th>fre.</th>
                        <td>09:00-10:00</td>
                      </tr>

                      <tr>
                        <th>lør.</th>
                        <td>09:00-10:00</td>
                      </tr>

                      <tr>
                        <th>søn.</th>
                        <td>09:00-10:00</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div className="py-4">
              <h3 className="font-semibold text-lg pb-2">Beskrivelse</h3>
              <div
                className="text-lg"
                dangerouslySetInnerHTML={{
                  __html: description
                }}
              />
            </div>
          </div>
          <div className="w-full md:w-1/3">
            <div className="bg-white sm:max-w-full max-w-md rounded overflow-hidden shadow-lg">
              <div className="border-b">
                <a
                  href={`tlf:${phoneNumber}`}
                  className="px-6 py-3 hover:bg-gray-200 flex"
                  rel="nofollow"
                >
                  <div className="w-8 h-8 rounded-full text-center align-middle text-lg">
                    <i className="fad fa-phone" />
                  </div>
                  <div className="pl-3">
                    <p className="text-sm font-semibold">Telefon</p>
                    <p className="text-xs text-gray-600">{phoneNumber}</p>
                  </div>
                </a>
              </div>
              <div className="border-b">
                <a href="#" className="px-6 py-3 hover:bg-gray-200 flex">
                  <div className="w-8 h-8 rounded-full text-center align-middle text-lg">
                    <i className="fad fa-browser" />
                  </div>
                  <div className="pl-3">
                    <p className="text-sm font-semibold">www</p>
                    <p className="text-xs text-gray-600">gotaste.dk</p>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Fragment>
  )
}

Place.propTypes = {
  greeting: PropTypes.string
}
export default Place
