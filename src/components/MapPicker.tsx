import { useEffect, useMemo } from "react";
import {
  MapContainer,
  TileLayer,
  Marker,
  Circle,
  useMap,
  useMapEvents,
} from "react-leaflet";
import L from "leaflet";

// Fix default marker icons (Leaflet + bundlers issue)
const DefaultIcon = L.icon({
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  iconRetinaUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
  iconSize: [25, 41],
  iconAnchor: [12, 41],
  popupAnchor: [1, -34],
  shadowSize: [41, 41],
});
L.Marker.prototype.options.icon = DefaultIcon;

interface RecenterProps {
  lat: number;
  lng: number;
}

const isValidCoord = (n: unknown): n is number =>
  typeof n === "number" && Number.isFinite(n);

const Recenter = ({ lat, lng }: RecenterProps) => {
  const map = useMap();
  useEffect(() => {
    if (!isValidCoord(lat) || !isValidCoord(lng)) return;
    map.setView([lat, lng], map.getZoom(), { animate: true });
  }, [lat, lng, map]);
  return null;
};

interface ClickHandlerProps {
  onPick: (lat: number, lng: number) => void;
}

const ClickHandler = ({ onPick }: ClickHandlerProps) => {
  useMapEvents({
    click(e) {
      onPick(e.latlng.lat, e.latlng.lng);
    },
  });
  return null;
};

export interface ExtraCircle {
  lat: number;
  lng: number;
  radiusKm: number;
  color?: string;
  label?: string;
}

interface MapPickerProps {
  lat: number;
  lng: number;
  radiusKm?: number;
  height?: string;
  draggable?: boolean;
  showRadius?: boolean;
  onChange?: (lat: number, lng: number) => void;
  extras?: ExtraCircle[];
  zoom?: number;
}

const MapPicker = ({
  lat,
  lng,
  radiusKm = 0,
  height = "320px",
  draggable = true,
  showRadius = true,
  onChange,
  extras = [],
  zoom = 13,
}: MapPickerProps) => {
  const safeLat = isValidCoord(lat) ? lat : 33.5651;
  const safeLng = isValidCoord(lng) ? lng : 73.1486;
  const center = useMemo<[number, number]>(() => [safeLat, safeLng], [safeLat, safeLng]);

  return (
    <div
      className="rounded-xl overflow-hidden border border-border"
      style={{ height }}
    >
      <MapContainer
        center={center}
        zoom={zoom}
        scrollWheelZoom
        style={{ height: "100%", width: "100%" }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        <Recenter lat={lat} lng={lng} />
        {draggable && onChange && <ClickHandler onPick={onChange} />}

        <Marker
          position={center}
          draggable={draggable && !!onChange}
          eventHandlers={{
            dragend: (e) => {
              const m = e.target as L.Marker;
              const p = m.getLatLng();
              onChange?.(p.lat, p.lng);
            },
          }}
        />
        {showRadius && radiusKm > 0 && (
          <Circle
            center={center}
            radius={radiusKm * 1000}
            pathOptions={{ color: "hsl(var(--primary))", fillOpacity: 0.1 }}
          />
        )}

        {extras.map((c, i) => (
          <Circle
            key={i}
            center={[c.lat, c.lng]}
            radius={c.radiusKm * 1000}
            pathOptions={{
              color: c.color || "hsl(var(--accent))",
              fillOpacity: 0.08,
            }}
          />
        ))}
      </MapContainer>
    </div>
  );
};

export default MapPicker;
