#1 - Keep (or replicas) from the systems
#notice the PATH I write to reach each trajectory

$SCHRODINGER/run trj_keep_selection_dl.py 915_a-out.cms ./915_merged/915_merged_trj/ 915_protein -asl  "backbone and chain A and res 7 - 311"

$SCHRODINGER/run trj_keep_selection_dl.py 916_a-out.cms ./916_merged/916_merged_trj/ 916_protein -asl  "backbone and chain A and res 7 - 311"

$SCHRODINGER/run trj_keep_selection_dl.py 917_a-out.cms ./917_merged/917_merged_trj/ 917_protein -asl  "backbone and chain A and res 7 - 311"

$SCHRODINGER/run trj_keep_selection_dl.py 854_a-out.cms ./854_merged/854_merged_trj/ 854_protein -asl  "backbone and chain B and res 7 - 311"




#2 - Aligning all the trajectories to their own first frame

$SCHRODINGER/run trj_align.py 915_protein-out.cms 915_protein_trj/ 915_algn_b -ref-mae Apo.mae -asl "backbone"

$SCHRODINGER/run trj_align.py 916_protein-out.cms 916_protein_trj/ 916_algn_b -ref-mae Apo.mae -asl "backbone"

$SCHRODINGER/run trj_align.py 917_protein-out.cms 917_protein_trj/ 917_algn_b -ref-mae Apo.mae -asl "backbone"

$SCHRODINGER/run trj_align.py 854_protein-out.cms 854_protein_trj/ 854_algn_b -ref-mae Apo.mae -asl "backbone"



#3 - merged
$SCHRODINGER/run trj_merge.py 915_algn_b-out.cms 915_algn_b_trj/ 916_algn_b_trj/ 917_algn_b_trj/ 854_algn_b_trj/ -o PCA_plppro -concat 0 1000

#4 - trj_essential_dynamics
$SCHRODINGER/run trj_essential_dynamics.py PCA_plppro-out.cms PCA_plppro_trj/ Plpro_PCA_merged -projection -cross-correlation




---------------------------------------------------------------------

linuxpro@linuxpro:/media/mount2/glaucio/PLPpro$ $SCHRODINGER/run trj_merge.py 915_algn_b-out.cms 915_algn_b_trj/ 916_algn_b_trj/ 917_algn_b_trj/ 854_algn_b_trj/ -o PCA_plppro -concat 0 1000
10025 frames from trajectory: 915_algn_b_trj/
10025 frames from trajectory: 916_algn_b_trj/
10025 frames from trajectory: 917_algn_b_trj/
9939 frames from trajectory: 854_algn_b_trj/
The resultant trajectory has 40014 frames.
linuxpro@linuxpro:/media/mount2/glaucio/PLPpro$ $SCHRODINGER/run trj_essential_dynamics.py PCA_plppro-out.cms PCA_plppro_trj/ Plpro_PCA_merged -projection -cross-correlation
Covariance is calculated using coordinate sets.
  Mode#     Variance    % Motion    Agg. Motion
--------  ----------  ----------  -------------
       1     325.564      29.307         29.307
       2     197.169      17.749         47.055
       3     119.274      10.737         57.792
       4      67.012       6.032         63.825
       5      65.481       5.894         69.719
       6      34.134       3.073         72.792
       7      27.914       2.513         75.305
       8      19.702       1.774         77.078
       9      16.729       1.506         78.584
      10      16.296       1.467         80.051

