# `isb-cgc-bq.HTAN.imaging_level4_HMS_orion_current.md`

## Column details

* [INT64]    `CellID`
  - Unique cell identifier in a specific image
* [FLOAT64]    `Hoechst`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `AF1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD31`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Ki_67`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD68`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD163`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD20`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD4`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD8a`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD45RO`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PD_L1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD3e`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `E_Cadherin`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PD_1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `FOXP3`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD45`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Pan_CK`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Blank`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `SMA`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `X_centroid`
  - X-position of the centroid calculated as the center of mass of the cell.
* [FLOAT64]    `Y_centroid`
  - Y-position of the centroid calculated as the center of mass of the cell.
* [INT64]    `Area`
  - Actual number of pixels in the region, returned as a scalar.
* [FLOAT64]    `MajorAxisLength`
  - Length (in pixels) of the major axis of the ellipse that has the same normalized second central moments as the region, returned as a scalar.
* [FLOAT64]    `MinorAxisLength`
  - Length (in pixels) of the minor axis of the ellipse that has the same normalized second central moments as the region, returned as a scalar.
* [FLOAT64]    `Eccentricity`
  - Eccentricity of the ellipse that has the same second-moments as the region, returned as a scalar. The eccentricity is the ratio of the distance between the foci of the ellipse and its major axis length. The value is between 0 and 1. (0 and 1 are degenerate cases. An ellipse whose eccentricity is 0 is actually a circle, while an ellipse whose eccentricity is 1 is a line segment.)
* [FLOAT64]    `Solidity`
  - Proportion of the pixels in the convex hull that are also in the region, returned as a scalar. Computed as Area/ConvexArea.
* [FLOAT64]    `Extent`
  - Ratio of pixels in the region to pixels in the total bounding box, returned as a scalar. Computed as the Area divided by the area of the bounding box.
* [FLOAT64]    `Orientation`
  - Angle between the x-axis and the major axis of the ellipse that has the same second-moments as the region, returned as a scalar. The value is in degrees, ranging from −90 degrees to 90 degrees.
* [STRING]    `Source_filename`
  - Name of file record was derived from
* [STRING]    `Source_entityId`
  - Synapse ID of source file
* [STRING]    `HTAN_Center`
  - Name of HTAN Center e.g. HTAN HTAPP
* [STRING]    `HTAN_Data_File_ID`
  - Self-identifier for this data file - HTAN ID of this file HTAN ID SOP (eg HTANx_yyy_zzz)
* [STRING]    `HTAN_Biospecimen_ID`
  - HTAN ID associated with a biosample based on HTAN ID SOP (eg HTANx_yyy_zzz)
* [FLOAT64]    `Argo550`
  - Mean intensity of pixels for specified marker

