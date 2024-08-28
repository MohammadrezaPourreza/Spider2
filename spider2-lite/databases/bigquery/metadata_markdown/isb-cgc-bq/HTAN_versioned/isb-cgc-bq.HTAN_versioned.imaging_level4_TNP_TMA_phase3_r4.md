# `isb-cgc-bq.HTAN_versioned.imaging_level4_TNP_TMA_phase3_r4.md`

## Column details

* [INT64]    `CellID`
  - Unique cell identifier in a specific image
* [FLOAT64]    `Hoechst1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `A488`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `A555`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `A647`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst2`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD3_Rat`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD11c`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `GranB`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst3`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Ki67`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `panCK`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD45`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst4`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD4`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD68`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD8a`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst5`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD11b`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `FOXP3`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PDL1_1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst6`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PCNA`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `ER`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `HER2`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst7`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD20`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `aSMA`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PD1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst8`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD57`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PDL1_2`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD3d`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst9`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD163`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `HLA_DR`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `HLA_DPB1`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Hoechst10`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD15`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CD44`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PDPN`
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
* [FLOAT64]    `PolICTD`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `pERK`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `p53`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Ecad`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `SMA`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `Vimentin`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `EGFR`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `pRB`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `p21`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CK14`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CK19`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CK17`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `LaminA_C`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `AR`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `H2ax`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `PR`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `HLAA`
  - Mean intensity of pixels for specified marker
* [FLOAT64]    `CK5`
  - Mean intensity of pixels for specified marker

