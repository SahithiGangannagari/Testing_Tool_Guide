<template>
  <div class="body">
    <img alt="Vue logo" src="../assets/st.png" class="image">
    <br>
    <br>
    <div v-if="showCheck" class="checklist">
      <div class="techDiv">
      <span>Technology</span>
        <div class="checkboxclass">
        <span v-for="(value, index) in tech_option" :key="index" class="box">
          <span class= "labelText" :title="value">{{value.name}}</span>
          <input type="checkbox" name="selectALl" id="selectALl"
            :checked="value.value" v-model="value.value">
          <!-- <br> -->
        </span>
        </div>
        <!-- <select class="select" v-model="selectTech">
          <option v-for="(val, ind) in tech_option" :key="ind" :value="val"> {{ val.name }} </option>
        </select> -->
      </div>
      <br>
      <div class="langdiv">
        <span> Languages Used</span>
        <div class="tags_content">
          <div class="dropdown">
            <div class="dropdown-items" @click="onClickFocusCaret('paragraphId')">
              <span v-for="(value, key) in selectedTagSuggestions" :key="key" class= "selectedItems">
                <span class= "labelText" :title="value">{{value.value}}</span>
                <img class="closeImg" src="../assets/close.png"
                  @click="removeSelectedTag(key, 'tags')"/>
              </span>
              <input v-model="inputTxt" class="searchbox"
              @input="getTagSuggestions(inputTxt)"
              id= "paragraphId"
              autocomplete="off"
              @keydown="monitor_key($event, 'tags')"
              @focus="onClickFocusCaret ('paragraphId')"
              :style="inputTxt.length?'width:'+((inputTxt.length *8)+20)+'px':'width:40px'"
              >
            </div>
            <div class="dropdown-content" v-if="showSuggestions">
              <div v-for="(suggestion, key) in tagSuggestions" :key="key"
              @click="SelectTagSuggestion(suggestion)"
              @mouseover="selectOption=suggestion.value;index=key" :id="suggestion.label"
              style="scroll-snap-align: end;">
                <!-- <span class="optionText" v-if="newTag"
                :title="suggestion.value">
                  {{suggestion.value}}
                </span> -->
                <span id= "suggestion" class="optionText"
                :style="selectOption === suggestion.value?'background: #eaeaea;':''"
                :title="suggestion.value">
                  {{suggestion.value}}
                </span>
              </div>
              <div class="d-flex justify-content-center">
                <div class="spinner-border text-primary" style="width: 20px; height: 20px; margin-bottom: 5px;"
                  role="status" v-if="isLoading">
                  <span class="sr-only">Loading...</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <!-- <div class="techDiv">
        <span>Type of Plan</span>
        <span v-for="(val, index) in type" :key="index" class="selectPlan">
          <input type="radio" :value="index" v-model="temp"> {{ val }}
        </span>
      </div> -->
      <br>
      <div class="tectDiv">
        <button class="btn_apply" @click="getToolNames();showCheck=false"> Submit </button>
      </div>
    </div>
    <div v-else class="checklist">
      <button class="btn_apply" @click="showCheck=true;reloadState()"> Back </button>
      <div class="toolname">
        <span class="fontClass"> Tools </span>
        <br>
        <br>
        <span v-for="(val, index) in toolName" :key="index">
          <div class="toolDiv">
            <span class="fontClass"> {{ val.tool_name }} </span><br>
            <span> <b>Details :</b> {{ val.description }}</span>
            <span> <b>Languages Defined :</b> {{ val.languages }} </span>
            <span> <b>Reference Link :</b>
            <a :href="val.ref_link" target="_">
              {{ val.ref_link }}
            </a>
            </span>
            <span> <b>Rating :</b> {{ val.rating }}</span>
          </div>
          <br>
        </span>
        <span v-if="showErr">{{ errmsg }}</span>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import axios from 'axios'
export default {
	data () {
		return {
				tech_option: [
					{
						name: 'Cloud',
            value: false,
            id: 1
					},
					{
						name: 'Mobile',
            value: false,
            id: 2
					},
					{
						name: 'Web app',
            value: false,
            id: 3
					},
					{
						name: 'API',
            value: false,
            id: 4
					}
				],
				type:[
					"Paid",
					"Free"
				],
				temp: '',
        languages: {},
        selectedTagSuggestions: [],
        tagSuggestions: [],
        selectOption: '',
        isLoading: false,
        selectALl: true,
        showSuggestions: false,
        newTag: false,
        inputTxt: '',
        toolName: [],
        showToolName: false,
        selectTech: '',
        errmsg: 'Nothing found in these combination',
        showErr: false,
        showCheck: true
		}
	},
  created () {
    this.getTechNames()
  },
	methods: {
    getToolNames () {
      // console.log(this.selectedTagSuggestions)
      console.log(this.selectTech)
      console.log(this.tech_option)
      this.showErr = false
      this.showToolName = false
      const path = '/getToolNames'
      const formdata = new FormData()
      formdata.append('selectedTags', JSON.stringify(this.selectedTagSuggestions))
      formdata.append('tech_option',JSON.stringify(this.tech_option))
      axios.post(path, formdata)
        .then((res) => {
          this.toolName = res.data
          console.log("++++++++++++++++++++")
          console.log(this.toolName)
          this.showToolName = true
          if (res.data.length == 0) {
            this.showErr = true 
          }
          var t = ''
          for(const id in this.toolName) {
            console.log("+++++")
            console.log(this.toolName[id].description)
            this.toolName[id].languages = this.toolName[id].languages
            this.toolName[id].ref = this.toolName[id].ref_link
            console.log(this.toolName)
          }
        })
        .catch((error) => {
          console.error(error)
        })
    },
    reloadState () {
      this.toolName = []
    },
    getTechNames () {
      const path = '/sample'
      const params = new URLSearchParams()
      axios.get(path, {
        params: params
      })
        .then((res) => {
          this.languages = res.data
          // console.log(res.data)
        })
        .catch((error) => {
          console.error(error)
        })
    },
    getTagSuggestions (tagText) {
      console.log("++++++++++++")
      this.showSuggestions = true
      this.isLoading = this.tagSuggestions.length > 0
      const path = '/getTagSuggestions'
      const params = new URLSearchParams()
      params.append('tagText', tagText)
      if (this.request) {
        this.request.cancel()
      }
      const axiosSource = axios.CancelToken.source()
      this.request = { cancel: axiosSource.cancel }
      axios.get(path, {
        params: params
      })
        .then((res) => {
          this.isLoading = false
          if (res.data.length > 0) {
            this.newTag = false
            this.tagSuggestions = res.data
            this.selectOption = this.tagSuggestions[0].value
          } else {
            this.newTag = true
            this.tagSuggestions = [{
              id: 0,
              value: 'Nothing found'
            }]
          }
        })
        .catch((error) => {
          console.error(error)
        })
    },
    SelectTagSuggestion (suggestion) {
      this.showSuggestions = false
      var arr = []
      if (this.selectedTagSuggestions.length > 0) {
        arr = Object.values(this.selectedTagSuggestions).map(function (tags) {
          return tags.value
        })
      }
      if (!arr.includes(suggestion.value)) {
        this.selectedTagSuggestions.push(suggestion)
        this.inputTxt = ''
        this.selectOption = ''
        document.getElementById('paragraphId').focus()
      }
      this.tagSuggestions = []
    },
    monitor_key (e, text) {
      if (this.inputTxt.length >= 25 && !(e.keyCode === 8 || e.keyCode === 32)) {
        e.preventDefault()
      }
      if (e.keyCode === 32 || e.keyCode === 13) {
        if (this.inputTxt.trim().length >= 3) {
          var temp = []
          temp = {
            id: 0,
            value: this.inputTxt
          }
          this.SelectTagSuggestion(temp)
          this.inputTxt = ''
          this.selectOption = ''
        }
      }
    },
    removeSelectedTag (key, text) {
      // this.showErr = false
      var temp = key
      if (temp > -1) {
        if (text === 'tags') {
          this.selectedTagSuggestions.splice(temp, 1)
        }
      }
      this.selectOption = ''
    },
    onClickFocusCaret (id) {
      // console.log("click")
      var el = document.getElementById(id)
      if (el) {
        if (Object.keys(this.selectedTagSuggestions).length < 5) {
          if (el.childNodes.length > 0) {
            var range = document.createRange()
            var sel = window.getSelection()
            range.setStart(el.childNodes[0], el.innerText.length)
            range.collapse(true)
            sel.removeAllRanges()
            sel.addRange(range)
            // el.focus()
          }
          el.focus()
        }
      }
    },
    clickoutside () {
      this.tagComponentText = ''
      this.selectOption = ''
    },
    outsideLabel () {
      if (this.showSuggestions) {
        this.inputTxt = ''
        this.showSuggestions = false
      }
    }
  }
}
</script>

<style>
.body {
	padding: 20px 30px;
  /* width: 100%; */
  display: block;
  flex-direction: column;
	align-content: center;
}
.fontClass {
  font-weight: bold;
  text-align: center;
}
.select {
	align-content: center;
  width: 200px;
  padding-left: 5px;
  padding-right: 25px;
  height: 30px;
  font-size: 12px;
  /* line-height: 1; */
  border: 1.5px solid #ced4da;
  border-radius: 2px;
  -webkit-appearance: none;
  background-color: #fff;
  background-image: url("../assets/downArrow.png");
  background-position: right 8px center;
  background-repeat: no-repeat;
  background-size: 12px;
	margin-left: 60px;
}
select::-ms-expand {
  display: none;
}
.image {
	width: 50%;
  height: 220px;
}
.checklist {
	border: 1.5px solid black;;
	padding: 20px 20px;
	margin: 10px 20%;
  display: flex;
  flex-direction: column;
	/* width: 50% */
}
.box {
  display: flex!important;
  margin-right: 5px;
}
.labelText {
  display: block;
  max-width: 110px;
  text-overflow: ellipsis;
  color: black;
  overflow: hidden;
  text-align: left;
  cursor: default;
  white-space: nowrap;
}
.checkbox{
  width: 15px;
  height: 15px;
  vertical-align: text-bottom;
  border-radius: 0;
  margin: 2px 10px;
}
.selectPlan {
  margin-left: 60px;
}
.dropdown {
  width: 100%;
  position: relative;
  margin-right: 1rem;
}
.dropdown-content {
  width: 100%;
  position: absolute;
  background-color: white;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
  max-height: 204px;
  scroll-snap-align: end;
  scroll-snap-type:y mandatory;
  overflow-x: hidden;
  overflow-y: auto;
}
.dropdown-content span {
  color: black;
  padding: 8px 10px;
  text-decoration: none;
  display: block;
  cursor: pointer;
}
.dropdown-items {
  display: flex;
  flex-wrap: wrap;
  width: 100%;
  border: 1.5px solid #ced4da;
  min-height: 30px;
  /* padding-left: 5px; */
  margin-bottom: 0px;
  max-height: 90px;
}
.searchbox {
  border: none;
  outline: none;
}
.selectedItems {
  display: -webkit-inline-box;
  max-width: 170px;
  font-size: 13px;
  line-height: 15px;
  height: 20px;
  /* height: max-content; */
  border: 0.5px solid rgba(0, 0, 0, 0.42);
  border-radius: 2px;
  position: relative;
  margin: 3px 2px 3px 2px;
  /* margin: 2px 1px 2px 2px; */
  padding: 2px 1px 0px 3px;
  background-color: #ebecf0;
}
.tags_content {
  width: auto;
  min-width: 40%;
  max-width: 70%;
  /* width: 40%; */
  /* overflow: auto; */
  display: flex;
  flex-direction: row;
  margin-left: 20px;
}
.closeImg {
  height: 15px;
  width: 14px;
  padding-left: 5px;
  margin-top: 1px;
  margin-left: -1px;
  margin-right: 2px;
  vertical-align: baseline;
  cursor: pointer;
}
.optionText {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.btn_apply {
  width: 70px;
  font-size: 13px;
  font-family: arial;
  padding: 4px 15px;
  background: #006699;
  border: 1px solid #006699;
  border-radius: 2px;
  color: #FFFFFF;
  height: 30px;
  margin: auto 0px;
}
.techDiv {
  margin-right: auto;
  display: flex;
}
.langdiv {
  display: flex;
  align-items: center;
  flex-direction: row;
}
.box {
  display: flex!important;
}
.checkbox{
  width: 15px;
  height: 15px;
  vertical-align: text-bottom;
  border-radius: 0;
  margin: 2px 10px;
}
.checkboxclass {
  margin-left: 60px;
  display: flex;
}
.toolDiv {
  border: 1.5px solid black;
  display: flex;
  flex-direction: column;
  text-align: left;
  padding: 10px;
}
.toolname {
  margin: 10px;
}
</style>
