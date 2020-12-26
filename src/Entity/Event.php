<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Event
 *
 * @ORM\Table(name="event", indexes={@ORM\Index(name="event-category", columns={"_categoryId"}), @ORM\Index(name="event-contest", columns={"_contestId"}), @ORM\Index(name="team-a-teamid", columns={"_teamIdA"}), @ORM\Index(name="event-location", columns={"_locationId"}), @ORM\Index(name="team-b-teamid", columns={"_teamIdB"})})
 * @ORM\Entity
 */
class Event
{
    /**
     * @var int
     *
     * @ORM\Column(name="eventId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $eventid;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="eventDate", type="datetime", nullable=false)
     */
    private $eventdate;

    /**
     * @var string|null
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="imageUrl", type="string", length=255, nullable=true)
     */
    private $imageurl;

    /**
     * @var int|null
     *
     * @ORM\Column(name="scoreTeamA", type="integer", nullable=true)
     */
    private $scoreteama;

    /**
     * @var int|null
     *
     * @ORM\Column(name="scoreTeamB", type="integer", nullable=true)
     */
    private $scoreteamb;

    /**
     * @var string|null
     *
     * @ORM\Column(name="note", type="text", length=65535, nullable=true)
     */
    private $note;

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_categoryId", referencedColumnName="categoryId")
     * })
     */
    private $categoryid;

    /**
     * @var \Contest
     *
     * @ORM\ManyToOne(targetEntity="Contest")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_contestId", referencedColumnName="contestId")
     * })
     */
    private $contestid;

    /**
     * @var \Location
     *
     * @ORM\ManyToOne(targetEntity="Location")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_locationId", referencedColumnName="locationId")
     * })
     */
    private $locationid;

    /**
     * @var \Team
     *
     * @ORM\ManyToOne(targetEntity="Team")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_teamIdA", referencedColumnName="teamId")
     * })
     */
    private $teamida;

    /**
     * @var \Team
     *
     * @ORM\ManyToOne(targetEntity="Team")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_teamIdB", referencedColumnName="teamId")
     * })
     */
    private $teamidb;

    public function getEventid(): ?int
    {
        return $this->eventid;
    }

    public function getEventdate(): ?\DateTimeInterface
    {
        return $this->eventdate;
    }

    public function setEventdate(\DateTimeInterface $eventdate): self
    {
        $this->eventdate = $eventdate;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImageurl(): ?string
    {
        return $this->imageurl;
    }

    public function setImageurl(?string $imageurl): self
    {
        $this->imageurl = $imageurl;

        return $this;
    }

    public function getScoreteama(): ?int
    {
        return $this->scoreteama;
    }

    public function setScoreteama(?int $scoreteama): self
    {
        $this->scoreteama = $scoreteama;

        return $this;
    }

    public function getScoreteamb(): ?int
    {
        return $this->scoreteamb;
    }

    public function setScoreteamb(?int $scoreteamb): self
    {
        $this->scoreteamb = $scoreteamb;

        return $this;
    }

    public function getNote(): ?string
    {
        return $this->note;
    }

    public function setNote(?string $note): self
    {
        $this->note = $note;

        return $this;
    }

    public function getCategoryid(): ?Category
    {
        return $this->categoryid;
    }

    public function setCategoryid(?Category $categoryid): self
    {
        $this->categoryid = $categoryid;

        return $this;
    }

    public function getContestid(): ?Contest
    {
        return $this->contestid;
    }

    public function setContestid(?Contest $contestid): self
    {
        $this->contestid = $contestid;

        return $this;
    }

    public function getLocationid(): ?Location
    {
        return $this->locationid;
    }

    public function setLocationid(?Location $locationid): self
    {
        $this->locationid = $locationid;

        return $this;
    }

    public function getTeamida(): ?Team
    {
        return $this->teamida;
    }

    public function setTeamida(?Team $teamida): self
    {
        $this->teamida = $teamida;

        return $this;
    }

    public function getTeamidb(): ?Team
    {
        return $this->teamidb;
    }

    public function setTeamidb(?Team $teamidb): self
    {
        $this->teamidb = $teamidb;

        return $this;
    }


}
