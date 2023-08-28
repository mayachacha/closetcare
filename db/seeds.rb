# 親カテゴリー
tops,bottoms,dress,shoes,outers,bags,accessories,pafumes,underwears,others = Genre.create([{name: "TOPS"}, {name: "BOTTOMS"},{name: "DRESS"}, {name: "SHOES"},{name: "OUTERS"},{name: "BAGS"},{name: "ACCESSORIES"},{name: "PAFUMES"},{name: "UNDERWEARS"},{name: "OTHERS"}])

# 子カテゴリー
tops.children.create([{name: "CARDIGAN"},{name: "KNIT"},{name: "SHIRT/BLOUSE"},{name: "JACKET"},{name: "CUT & SAW"},{name: "OTHERS"}])
bottoms.children.create([{name: "PANTS"},{name: "DENIM"},{name: "SKIRT"},{name: "OTHERS"}])
dress.children.create([{name: "ONEPICE"},{name: "DRESS"},{name: "OTHERS"}])
shoes.children.create([{name: "SNEAKERS"},{name: "BOOTS"},{name: "SANDLS"},{name: "HEELS"},{name: "OTHERS"}])
outers.children.create([{name: "COAT"},{name: "JACKET"},{name: "OTHERS"}])
